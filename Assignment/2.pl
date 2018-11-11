#DT282/4
#Bioinformatics Assignment 1
#Erika Secillano
#C15339871
#
#Takes a .fasta file as input, either through command line, or user input at run time. 
#Displays: 
#1) All start and stop codons in the transalted prokarayotik dna sequence, read from file
#2) All Potential Open Reading Frames containted within this sequence
#3) Potential Open Reading Frames with False ORFs Removed

#! /s/bin/perl -w
use warnings;
use strict;

##User enters the file
print "Please enter your .fasta file ";
##reads the input file and put it in $DNAfilename
my $filename = <STDIN>;
chomp $filename;

##boolean expression when false cannot open file, true proceed
unless ( open(FILE, $filename) ) {
    print "Cannot open file \"$filename\"\n\n";
}

##Get the file and put it inside @DNA
my @DNA = <FILE>;
##skips the first line
splice(@DNA, 0, 1);
##close
close FILE;
##put DNA array into string
my $DNA = join( '', @DNA);
$DNA =~ s/\s//g;

####Get all the frames and Amino Acids####
##make a string to store the frame
my $frame1 ="";
##for loop for the DNA
for (my $i=0; $i<length($DNA)-3; $i+=3)
{
	##get the codon substr EXPR,OFFSET,LENGTH
    my $codon = substr($DNA,$i,3);
	##concatenating $codon to end of $frame1 and also get the amino acids
    $frame1 .=&getAA($codon);
}
my $frame2 ="";
for (my $i=1; $i<length($DNA)-3; $i+=3)
{
    my $codon = substr($DNA,$i,3);
    $frame2 .=&getAA($codon);
}
my $frame3 ="";
for (my $i=2; $i<length($DNA)-3; $i+=3)
{
    my $codon = substr($DNA,$i,3);
    $frame3 .=&getAA($codon);
}
##reverse the dna file to get frames 4-6
my $reversedna= reverse($DNA);
$reversedna =~ tr/AaTtGgCc/TtAaCcGg/; 

my $frame4 ="";
for (my $i=0; $i<length($reversedna)-3; $i+=3)
{
    my $codon = substr($reversedna,$i,3);
    $frame4 .=&getAA($codon);
}
my $frame5 ="";
for (my $i=1; $i<length($reversedna)-3; $i+=3)
{
    my $codon = substr($reversedna,$i,3);
    $frame5 .=&getAA($codon);
}
my $frame6 ="";
for (my $i=2; $i<length($reversedna)-3; $i+=3)
{
    my $codon = substr($reversedna,$i,3);
    $frame6 .=&getAA($codon);
}
####Get frames and Amino Acids end####

####GET ORF####
print "\nFRAME 1\n";
print "The translated protein is :\n$frame1\n";
##local temporary amends the value of $frame1 
local $_  = $frame1;
##finds M globaly
while ( /M/g ) {
	##get the postion - 1 to include M
	my $start = pos() - 1;
	##if _ is found then proceed
	if ( /_/g ) {
		##Get the position where _ is found
		my $stop = pos;
		##Get the length of the Amino Acids
		my $TotalLength = $stop - $start;
		##if the tptal length is > 25 then proceed
		if($TotalLength > 25)
		{
			print "\nORF";
			print "\n The start: ",$start, " \n The stop: ", $stop, " \n The length: ", $TotalLength, " \n", 
			substr ($_, $start, $stop - $start ), "\n"; 
		}
		else
		{
			#Print the ORF that was to be removed
			print "\nORF TO BE REMOVED";
			print "\n The start: ",$start, " \n The stop: ", $stop, " \n The length: ", $TotalLength, " \n",
			substr ($_, $start, $stop - $start ), "\n";
		}
	}
}

print "\nFRAME 2\n";
print "The translated protein is :\n$frame2\n";
local $_  = $frame2;
while ( /M/g ) {
   my $start = pos() - 1;
   if ( /_/g ) {
		my $stop = pos;
		my $TotalLength = $stop - $start;
		if($TotalLength > 25)
    {
		print "\nORF";
        print "\n The start: ",$start, " \n The stop: ", $stop, " \n The length: ", $TotalLength, " \n", 
        substr ($_, $start, $stop - $start ), "\n";    
		##need last for frame 2 for some reason if not it will have infinite loop
        last;
    }
    else
    {
        print "\nORF TO BE REMOVED";
		print "\n The start: ",$start, " \n The stop: ", $stop, " \n The length: ", $TotalLength, " \n",
		substr ($_, $start, $stop - $start ), "\n";
    }
   }
}
print "\nFRAME 3\n";
print "The translated protein is :\n$frame3\n";
local $_  = $frame3;
while ( /M/g ) {
   my $start = pos() - 1;
   if ( /_/g ) {
		my $stop = pos;
		my $TotalLength = $stop - $start;
		if($TotalLength > 25)
    {
		print "\nORF";
        print "\n The start: ",$start, " \n The stop: ", $stop, " \n The length: ", $TotalLength, " \n", 
        substr ($_, $start, $stop - $start ), "\n";  
    }
    else
    {
        print "\nORF TO BE REMOVED";
		print "\n The start: ",$start, " \n The stop: ", $stop, " \n The length: ", $TotalLength, " \n",
		substr ($_, $start, $stop - $start ), "\n";
    }
   }
}
print "\nFRAME 4\n";
print "The translated protein is :\n$frame4\n";
local $_  = $frame4;
while (/M/g) {
   my $start = pos() - 1;
   if ( /_/g ) {
		my $stop = pos;
		my $TotalLength = $stop - $start;
		if($TotalLength > 25)
    {
		print "\nORF";
        print "\n The start: ",$start, " \n The stop: ", $stop, " \n The length: ", $TotalLength, " \n", 
        substr ($_, $start, $stop - $start ), "\n";
    }
    else
    {
        print "\nORF TO BE REMOVED";
		print "\n The start: ",$start, " \n The stop: ", $stop, " \n The length: ", $TotalLength, " \n",
		substr ($_, $start, $stop - $start ), "\n";
    }
   }
}
print "\nFRAME 5\n";
print "The translated protein is :\n$frame5\n";
local $_  = $frame5;
while ( /M/g ) {
   my $start = pos() - 1;
   if ( /_/g ) {
		my $stop = pos;
		my $TotalLength = $stop - $start;
		if($TotalLength > 25)
    {
		print "\nORF";
        print "\n The start: ",$start, " \n The stop: ", $stop, " \n The length: ", $TotalLength, " \n", 
        substr ($_, $start, $stop - $start ), "\n";
    }
    else
    {
        print "\nORF TO BE REMOVED";
		print "\n The start: ",$start, " \n The stop: ", $stop, " \n The length: ", $TotalLength, " \n",
		substr ($_, $start, $stop - $start ), "\n";
    }
   }
}
print "\nFRAME 6\n";
print "The translated protein is :\n$frame6\n";
local $_  = $frame6;
while ( /M/g ) {
   my $start = pos() - 1;
   if ( /_/g ) {
		my $stop = pos;
		my $TotalLength = $stop - $start;
		if($TotalLength > 25)
    {
		print "\nORF";
        print "\n The start: ",$start, " \n The stop: ", $stop, " \n The length: ", $TotalLength, " \n", 
        substr ($_, $start, $stop - $start ), "\n";
    }
    else
    {
        print "\nORF TO BE REMOVED";
		print "\n The start: ",$start, " \n The stop: ", $stop, " \n The length: ", $TotalLength, " \n",
		substr ($_, $start, $stop - $start ), "\n";
    }
   }
}
####END GET ORF####

####get the amino acids####
sub getAA
{
	##read as sub routine parameter
	my($codon)=@_;
	##The table 
	my(%AA)=('TCA' => 'S', 'TCC' => 'S', 'TCG' => 'S', 'TCT' => 'S',   # Serine
    'TTC' => 'F', 'TTT' => 'F',    # Phenylalanine
    'TTA' => 'L', 'TTG' => 'L',    # Leucine
    'TAC' => 'Y', 'TAT' => 'Y',    # Tyrosine
    'TAA' => '_', 'TAG' => '_', 'TGA' => '_',    # Stop
    'TGC' => 'C', 'TGT' => 'C',   # Cysteine
    'TGG' => 'W',    # Tryptophan
    'CTA' => 'L', 'CTC' => 'L', 'CTG' => 'L', 'CTT' => 'L',   # Leucine
    'CCA' => 'P', 'CCC' => 'P', 'CCG' => 'P', 'CCT' => 'P',   # Proline
    'CAC' => 'H', 'CAT' => 'H',   # Histidine
    'CAA' => 'Q', 'CAG' => 'Q',   # Glutamine
    'CGA' => 'R', 'CGC' => 'R', 'CGG' => 'R', 'CGT' => 'R',   # Arginine
    'ATA' => 'I', 'ATC' => 'I', 'ATT' => 'I',   # Isoleucine
    'ATG' => 'M',    # Methionine  using a space a it is easier to see in a quick inspection
    'ACA' => 'T', 'ACC' => 'T', 'ACG' => 'T', 'ACT' => 'T',    # Threonine
    'AAC' => 'N', 'AAT' => 'N',     # Asparagine
    'AAA' => 'K', 'AAG' => 'K',   # Lysine
    'AGC' => 'S', 'AGT' => 'S',   # Serine
    'AGA' => 'R', 'AGG' => 'R',   # Arginine
    'GTA' => 'V', 'GTC' => 'V', 'GTG' => 'V', 'GTT' => 'V',   # Valine
    'GCA' => 'A', 'GCC' => 'A', 'GCG' => 'A', 'GCT' => 'A',   # Alanine
    'GAC' => 'D', 'GAT' => 'D',   # Aspartic Acid
    'GAA' => 'E', 'GAG' => 'E',    # Glutamic Acid
    'GGA' => 'G', 'GGC' => 'G', 'GGG' => 'G', 'GGT' => 'G', # Glycine
    );
	##if the codons exists in the table then proceed
	if(exists $AA{$codon})
		{	
			##the amino acids are returned
			return $AA{$codon};
		}
		else
		{
			##prints codon not found
			print "Codon not found \"$codon\"!!\n";
			exit;
		}
}
####get the amino acids END####

####COMMENTS####
##The ORF TO BE REMOVED was chosen because it was less than 25 amino acids although the smallest protein
##is 20 amino acids
##The first found start codon was used to represent the start codon
##There are other ways of eliminating false positives such as bias coding
####END####