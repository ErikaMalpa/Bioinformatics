#!/usr/bin/perl
# defined fnt is true if $line assigned a value 

use strict;
use warnings; 

print 'Type something. "ctrl Z" to finish: ';



while ( <> ) 
{
	print "You typed '$_'\n\n";
	
	# change value of sentinal variable
	print 'Type something again . "ctrl Z" to finish: ';
		
	
	
}

print "goodbye!\n"; 