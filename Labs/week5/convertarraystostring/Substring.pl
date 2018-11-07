#!/usr/bin/perl 
#translate.pl -- translate nucleic acid sequence to protein sequence
#                according to standard genetic code

use strict;
use warnings;

#   process input data

while (my $line = <DATA>) {                           # read in line of input
    print "$line";                                       # transcribe to output
    chomp $line;   
    # remove end-of-line character
    	
	
	# loop to go through the input line and remove substrings of size 3
	for(my $index = 0; $index < (length($line)); $index+=3)
	{
	   my $sub = substr ($line, $index, 3);
	   print "$sub\n";
	}
	
	print "\n\n$line";
}                                                       



	# more details on substrings can be found at:
	# http://perlmeme.org/howtos/perlfunc/substr.html
	
	# refer to Substring_Eg.pl

# what follows is input data

__END__
atgcatccctttaat
tctgtctga



