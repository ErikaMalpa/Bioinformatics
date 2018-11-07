#!/usr/bin/perl
#    determine the number of characters and the number of lines entered by the user.pl

use strict;
use warnings;


my $length = 0; # set length counter to zero
my $lines = 0; # set number of lines to zero

print "enter text one line at a tine and press (ctrl z) to quit\n\n";


while (<>)   # read one line from the keyboard at a time
{ 

	chomp; # remove terminal newline
	$length = $length + length $_ ;
	$lines = $lines  + 1;
}

print "you entered/inputted contains the following:\n";
print "LENGTH = $length\n";
print "LINES = $lines\n";
print " this is the end of the program ";