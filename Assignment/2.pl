#! /s/bin/perl -w

# This program can be used to extract ORFs from a genome.
# The coordinates of the ORFs are printed, and '+' is printed
# after ORFs that are known genes, and '-' is printed after ORFs
# that are not known genes.
#
# Before running it, you should first adjust the variable below
# indicating where in the sequence to start looking for ORFs.
# The run the program as follows: extract-orfs.pl <seq-file> <gene-index-file>
#
# The file <seq-file> should contain the genome sequence in text form
# and the file <gene-index-file> should list the coordinates of
# known genes.


# first position from which to start looking for ORFs
$search_start_position = 223409;


# hash table for getting complement of a base
%complement_char = ("a" => "t",
		    "c" => "g",
		    "g" => "c",
		    "t" => "a",
		    );


# hash table for genes: key is starting position, value is ending position
%genes_begin = ();
# hash table for genes: key is ending position
%genes_end = ();


# file containing complete genome sequence
$seq_file = $ARGV[0]; shift;


# file containing list of genes
$gene_file = $ARGV[0]; shift;


# read the sequence file
open(SEQ_FILE, "<$seq_file") or die "failed to open file $seq_file\n";
$seq = read_seq_file();
$genome_length = length $seq;


# open the file listing genes
# skip line with column headers
open(GENE_FILE, "<$gene_file") or die "failed to open file $gene_file\n";
$line = <GENE_FILE>;


# put positions of forward-strand genes in a hash table;
# check to see what start/stop codons are listed for genes
while ($line = <GENE_FILE>)
{
    if ($line =~ /\w+ \w+ (\d+) (\d+) (.)/)
    {

	if ($3 eq ">")
	{
	    # forward strand

	    # put this gene in hash tables
	    $genes_begin{$1} = $2;
	    $genes_end{$2} = "t";

	    # determine start and stop codons for this gene
	    $start = substr $seq, $1 - 1, 3;
	    $stop = substr $seq, $2 - 3, 3;
	    # print "$start $stop\n";
	}
	else
	{
	    # complement strand

	    # determine start and stop codons for this gene
	    $stop = substr $seq, $1 - 1, 3;
	    $stop = complement_sequence($stop);
	    $start = substr $seq, $2 - 3, 3;
	    $start = complement_sequence($start);
	    # print "$start $stop\n";
	}
    }
}


# keep track of end positions of negative example ORFs so that we don't
# have a bunch of nested negative examples
%neg_orfs_end = ();


# now look for ORFs we can use as test sequences
while ($search_start_position < $genome_length)
{
    $begin = find_begin_of_ORF($seq, $search_start_position);
    $end = find_end_of_ORF($seq, $begin);

#    print "found ORF ($begin, $end)\n";

    if (exists $genes_begin{$begin} && $genes_begin{$begin} == $end)
    {
	print "$begin $end +\n";
    }
    elsif (($end - $begin > 300) && !(exists $genes_end{$end}) &&
	   !(exists $neg_orfs_end{$end}))
    {
      $neg_orfs_end{$end} = "t";
      print "$begin $end -\n";
    }

    $search_start_position = $begin + 1;
}


# read the genome sequence from a file pointed to by SEQ_FILE
sub read_seq_file
{
    my ($seq);

    $seq = "";

    while ($line = <SEQ_FILE>)
    {
	while (length($line) > 80)
	{
	    chop($line);
	}
	$seq .= $line;
    }
    
    return $seq;
}


# given a sequence, return its reverse complement
sub complement_sequence
{
    my ($seq) = @_;

    @chars = split //, $seq;
    @complement = map { $complement_char{$_} } @chars;

    $comp_seq = join "", reverse @complement;

    return $comp_seq;
}


# Given a sequence and a starting position to search from, find the
# position of the next possible "atg" start codon in the sequence.
# All positions are in sequence coordinates (i.e. starting from 1).
sub find_begin_of_ORF
{
    my ($seq, $start_pos) = @_;

    # decrement $start_pos since string index starts at 0 but
    # sequence index starts at 1
    --$start_pos;

    $pos = index($seq, "atg", $start_pos);	

    return $pos + 1;
}


# Given a sequence and the start position of a candidate ORF (the position 
# of a start codon), return the position of the last base in the ORF
# (the position of the last base in an in-frame stop codon).  All positions
# are in sequence coordinates (i.e. starting from 1).
sub find_end_of_ORF
{
    my ($seq, $start_pos) = @_;
    my ($found, $pos1, $pos2, $pos3, $stop_pos);

    # decrement $start_pos since string index starts at 0 but
    # sequence index starts at 1
    --$start_pos;

    my ($start_pos1, $start_pos2, $start_pos3) = 
	($start_pos + 3, $start_pos + 3, $start_pos + 3);

    $found = 0;
    while (!$found && 
	   ($start_pos1 < $genome_length - 3 ||
	    $start_pos2 < $genome_length - 3 ||
	    $start_pos3 < $genome_length - 3))
    {
	$pos1 = index($seq, "taa", $start_pos1);
	if ($pos1 >= 0 && (($pos1 - $start_pos) % 3 == 0))
	{
	    $found = 1;
	    $stop_pos = $pos1;
	}
	elsif ($pos1 == -1)
	{
	    $pos1 = $genome_length;
	}

	$pos2 = index($seq, "tag", $start_pos2);	
	if ($pos2 >= 0 && (($pos2 - $start_pos) % 3 == 0))
	{
	    if (!$found || $pos2 < $stop_pos)
	    {
		$found = 1;
		$stop_pos = $pos2;
	    }
	}
	elsif ($pos2 == -1)
	{
	    $pos2 = $genome_length;
	}

	$pos3 = index($seq, "tga", $start_pos3);	
	if ($pos3 >= 0 && (($pos3 - $start_pos) % 3 == 0))
	{
	    if (!$found || $pos3 < $stop_pos)
	    {
		$found = 1;
		$stop_pos = $pos3;
	    }
	}
	elsif ($pos3 == -1)
	{
	    $pos3 = $genome_length;
	}

	if (!$found)
	{
	    $start_pos1 = $pos1 + 1;
	    $start_pos2 = $pos2 + 1;
	    $start_pos3 = $pos3 + 1;
	}
    }

    if ($found)
    {
	return $stop_pos + 3;
    }
    else
    {
	return -1;
    }
}