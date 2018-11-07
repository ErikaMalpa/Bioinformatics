#! /usr/bin/perl 

use strict;
use warnings;



# The 'push' and unshifting program - adds elements to the end and to the beginning of an array 


# create an array with 5 elements - each element contains a DNA sequence 

 my @seq = ( 'TTATTATGTT', 'GCTCAGTTCT', 'GACCTCTTAA', 
               'CTATGCGGTA', 'ATCTGACCTC' );
    

# print the value of the original array

		print "\n\n@seq";
	
	
   
#use a simple for loop to add 3 elements to the end of the array via the key board

for (my $index = 0; $index <3; $index++)
{
		print "\nenter the sequence to add to the end of the array: "; 
		chomp(my $sequence = <>);
		push @seq, $sequence;
}
	

	print "\n@seq\n";     # prints the elements of an array on one line
	
	
		
		
	
# add elements to begining of the array 

 print "\n\nadding elements to the start of the array\n\n\n";

for (my $index = 0; $index <3; $index++)
{
		print "enter the sequence to add to the begining of the array: "; 
		chomp(my $sequence = <>);
		unshift @seq, $sequence;
}
	

		print "\n\nthe sequence of the array is: \n", "@seq";
	
	
	
