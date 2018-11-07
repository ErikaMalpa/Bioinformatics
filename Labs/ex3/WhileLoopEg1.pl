#!/usr/bin/perl
# defined fnt is true if $line assigned a value 

use strict;
use warnings; 

print 'Type something. "quit" to finish: ';
my $line = <>;
chomp $line;

while ( $line ne 'quit' ) 
{
	print "You typed '$line'\n\n";
	
	# change value of sentinal variable
	print 'Type something again . "quit" to finish: ';
	$line = <>;
	chomp $line;	
	
	
}

print "goodbye!\n"; 