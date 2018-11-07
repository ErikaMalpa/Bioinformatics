#! /usr/bin/perl -w

# The 'bases' program - a hash of the nucleotide bases.

use strict;
use warnings;


# DECLARE AND DEFINE A HASH TABLE 
my %nucleotide_bases = ( A => "Adenine", 
					  T => "Thymine", 
                      G => "Guanine", 
					  C => "Cytosine" );



# ADD AN ENTRY TO THE HASH TABLE					  
  $nucleotide_bases{'U'} = 'This is a RNA base called Uracil';
 
 
print "\nEnter the first letter of a nucleotide base(A/T/G/C): (ctrl Z to exit: "; 
while (<>)     
{
    
	chomp; # remove E.O.L character from default variable $_
	
	
	
	print "\n the name of the base is: ", $nucleotide_bases{$_}, "\n";
	print "\n Enter anothe base or ctrl Z to exit: ";
	
	
}

print "\n";
