#!/usr/bin/perl

use strict;
use warnings;


 # assign value to the strings
 
 my $class = "dt249 4";
 my $seq = "ACTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTGC";  #Pu-C-X(40-80)-Pu-C
 
 # conform the pattern matching notation 
 
	if ($class =~ /\w+\s\d/)
	{
		print "the class code format is correct\n";
	}


	if ($seq =~/[AG]C[ATGC]{40,80}[AG]C/)
	{
		print "the sequence is in the correct format \n";
		
	}
	
	