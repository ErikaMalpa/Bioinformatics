#!/usr/bin/perl
# file Split_ARRAY.pl


use strict;
use warnings;

	print "\n\nthe original descriptor line \n";
    my $line = ">192a8, the lactose gene, e. coli, cambridge university, january 1981";
	my $sequence = "AATTCC";   # DNA sequence
	
	 # print the string before the split
	print "$line\n\n";
	print "\nthe DNA sequence is: $sequence";
	
	
	#split the strings
	
	my @fields = split ',',$line;   #splits a String into an array 
	(my $ID,my $GeneName,my $Organism,my$Laboratory,my $Date) = split ',',$line;  # convery a string into a list
		
	my @fields2 = split '',$sequence;      #convert sequence into an array

	#display the elements of the array using foreach loop
	
	print " the descriptor line as elements of an array\n";
	foreach my $headings(@fields)
	{
	
		print "$headings\n"; 
	}
	
	print " the descriptor line as elements of an array\n";
	foreach my $headings2(@fields2)
	{
	
		print "$headings2\n"; 
	}


	#display elements of the list
	print "\n\nthe descriptor line as elements of a list\n";
	print "id is $ID\n";
	print "the gene name is: $GeneName\n";
	print "the organism is: $Organism\n";
	print "the sequencing lab is: n$Laboratory\n";
	print "the date of sequencing was: $Date\n";
	
	
	
	
	