#!/usr/bin/perl

use strict;
use warnings;

my $A = 0;
my $C = 0;
my $T = 0;
my $G = 0;
my $seq;

print "Please enter a file name e.x. Dna_Seq.fasta \n"; #Ask the user to enter file name
my $input = <>;
open MYFILE, $input or die "cannot open the file \n";
my $input = <MYFILE>;
chomp $input; 

while (<MYFILE>) 
{
	if ($_ =~/^>/)  #this ignore header line
    {
		next; #starts the next iteration in a loop
	}
	else
    {
		$seq  = $_; #copy all line with only nucleotide characters ATGC
    }

	print "$seq\n"; # verify previous step

	#(tell what to do, which one to use)
	#@dna is an array
	my @dna = split (//,$seq); #create an array to include each nucleotide as array element

	foreach my $element (@dna)
	{
		if ($element =~/A/) # match nucleotide pattern and countstrong text
		{
			$A++;
		}
		if ($element =~/T/)
		{
			$T++;
		}
		if ($element =~/G/)
		{
			$G++;
		}
		if ($element =~/C/)
		{
			$C++;
		}
	}
}

#Print the amount of ATCG
print  "A=$A\n";
print  "T=$T\n";
print  "G=$G\n";
print  "C=$C\n\n";

print "MYFILE contains $. lines \n\n"; #This prints how many lines