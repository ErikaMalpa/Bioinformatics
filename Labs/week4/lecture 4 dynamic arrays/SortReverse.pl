#! /usr/bin/perl 

# The 'slices' program - slicing arrays.

use strict;
use warnings;

my @sequences = ( 'TT', 'GC', 'GA', 'AC', 'AT', 'GT' );


 # Sort arrays 
print "\n\nThe sequence before a sort or reverse is: \n@sequences  \n";
my @seq = sort(@sequences);     # this is sometimes referred to as slicing 
print "The sequence after the sort is: \n@seq\n";

 # Reverse arrays 
my @reverse = reverse(@sequences);
print "The sequence after the reverse is: \n@reverse\n\n";


 # reverse string
 
my $string = "denis from cork";

print "original string 1s: $string\n"; 
my $reverse = reverse($string);
print "\nthe reversed string is: $reverse\n";


