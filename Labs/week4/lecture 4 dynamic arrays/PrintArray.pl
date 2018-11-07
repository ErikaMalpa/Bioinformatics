#! /usr/bin/perl 

# The 'iterateF' program - iterate over an entire array with 'foreach'.


use strict;
use warnings;


my @sequences = ( 'TTATTATGTT', 'GCTCAGTTCT', 'GACCTCTTAA', 
                   'CTATGCGGTA', 'ATCTGACCTC' );

 #print values using standard for loop
 
 
for (my $index = 0; $index < 5; $index++)
{

	print "$sequences[$index]\n";
}

	print "\n\n";



#print values using size of the array and a for loop	

	
for (my $index = 0; $index < scalar(@sequences) ; $index++)  # note scalar(@sequences) returns the number of elements in the array
{

	print "$sequences[$index]\n";
}
	
	print "\n\n";
	
#print values foreach loop: equivalent to size and for above
	
foreach my $value(@sequences )
{
    print "$value\n";
}
