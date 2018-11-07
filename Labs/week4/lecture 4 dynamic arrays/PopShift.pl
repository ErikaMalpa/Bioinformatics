#! /usr/bin/perl 

use strict;
use warnings;



# The 'PopShift' program - popping, shifting.

my @sequences = ( 'TTATTATGTT', 'GCTCAGTTCT', 'GACCTCTTAA', 
                   'CTATGCGGTA', 'ATCTGACCTC' );
    

# remove last element form an array

	print "original array is: @sequences\n";
	my $last = pop @sequences;
	print "\nthe last element of the array was: $last \n";
	print "\narray after the pop:   @sequences\n";
	
	# remove the first element form an array 
	my $first = shift @sequences;
	print "\nthe first element was $first\n";
	print "\narray after the shift: @sequences\n";
