#! /usr/bin/perl 

# The 'slices' program - slicing arrays.

use strict;
use warnings;

my @sequences = ( "TTATTATGTT", "GCTCAGTTCT", "GACCTCTTAA", "CTATGCGGTA", "ATCTGACCTC" );


 # slice [assignment but not remove] elements from the array
print "\n\nThe sequence before the slice is: \n @sequences  \n\n";
my @slic = @sequences [1 .. 3 ];     # this is referred to as slicing 
print "The sequence after slicing elements 1 to 3 is: (no elements are actually removed from the array) \n\n\ @sequences \n\n";
print "The elements of the slice array are: \n@slic\n\n";

 # splice [remove] elements from the array
my @splice = splice @sequences,1, 2;
print "The sequence after the splice is: (elements are actually removed from the array) \n@sequences\n";
print "The splice sequence is: \n@splice\n";

 
 # other functions
 
 my $element = $sequences[2];
 
 my @copy = @sequences;  
 
 # combined function
 
 my @combined = (@slic, @splice);
 print " \nthe value of element [2] is:  $element\n";
 print "\n the value(s) of the copy array are: @copy\n";  
 print " \nthe contents of combining slice and splice are: \n @combined";



