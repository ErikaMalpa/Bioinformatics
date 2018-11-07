#!/usr/bin/perl

use strict;
use warnings;

print "Is there lactose? [Y/N] \n";
my $lac_input = <>;
chomp $lac_input;

if ($lac_input =~ /Y/)
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