#!/usr/bin/perl
# file size2.pl
#
use strict;
use warnings;


my $length = 0;
my $lines = 0;

	print "enter the name of the file: "; 
	my $file = <>;
	chomp $file;
	
	open MYFILE, "$file" or die " can not find the file ending program!!!!!!!!!!!!\n";

	
	while (<MYFILE>)
	{
		chomp;
		$length = $length + length $_ if $_ =~ /[GATCgatc]/; #N is any base;  
		$lines = $lines + 1;
	}

	print "LENGTH = $length\n";
	print "LINES = $lines\n";