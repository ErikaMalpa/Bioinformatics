#!/usr/bin/perl

use strict;
use warnings;

my $A = 0;
my $C = 0;
my $T = 0;
my $G = 0;
my $total = 0;
my $seq;

open MYFILE, 'Dna_Seq.fasta' or die "cannot open the file \n \n"; #Opens the file
my $file = <MYFILE>;

#Prints the descriptor line
print "\n$file\n";

#Ask the user to display the DNA sequence
print "Would you like to display the number of DNA Nucleotides of the file? [Y\\N] \n";
my $answer = <>;

if ($answer =~ /Y/)
{
	while(<MYFILE>)
	{
		if ($_ =~/^>/)  #this ignore header line
		{
			next; #starts the next iteration in a loop #Calculate length l = l + lrngth $_
		}
		else
		{
			$seq  = $_; #copy all line with only nucleotide characters ATGC
		}

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
	print "MYFILE contains $. lines \n\n"; #This prints how many lines
	
	#Print the amount of ATCG
	print  "A=$A\n";
	print  "T=$T\n";
	print  "G=$G\n";
	print  "C=$C\n\n";
	$total = $A + $T + $C + $G;
	print "The total is: $total \n";
}
elsif ($answer =~ /N/)
{
	print "Okay then no Problem I will not print it";
}
else
{
	print "Incorrect input";
}