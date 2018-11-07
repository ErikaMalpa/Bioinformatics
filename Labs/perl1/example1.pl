#!/usr/bin/perl

use strict;
use warnings;

my $x = 12;
my $y = 6;
my $z = 8;

print "x power of y", $x ** $y, "\n";
print "x % y", $x % $y, "\n";
print "x mod z", $x % $z, "\n";
print "getg", my $a = $x + $y + $z, "\n", "\n", "\n";

print "Hello please enter a number to assign to \$w", "\n"; 
my $w = <>;
print "the input is ", $w;