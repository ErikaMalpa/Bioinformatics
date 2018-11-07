#!/usr/bin/perl

use strict;
use warnings;

print "Please enter a file name e.x. Dna_Seq.fasta \n"; #Ask the user to enter file name
my $input = <>;
open MYFILE, $input or die "cannot open the file \n";
my $input = <MYFILE>;
chomp $input;

#Prints the descriptor line
print "\n$input\n";

#Prints the first 2 lines

#for (1..2)
#{
#	print scalar (<MYFILE>);
#}

#counter
my $i=0;

while (<MYFILE>) {
	if ($i >1) 
	{ 
		last; #break statement in C, used in loops
	}
	print $_ ;
	$i++;
}