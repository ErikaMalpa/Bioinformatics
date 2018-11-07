#!/usr/bin/perl

use strict;
use warnings;

print "Tryptophan present? [Y/N] \n";
my $input = <>;
chomp $input;

if ($input =~ /Y/)
{
	print "Yes";
}
elsif ($input =~ /N/)
{
	print "Okay then no Problem I will not print it";
}
else
{
	print "Incorrect input";
}