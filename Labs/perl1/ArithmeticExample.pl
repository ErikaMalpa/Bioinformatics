#!/usr/bin/perl

# ensures that global variables "should" not be declared
use strict;
use warnings;

# arithmetic example 

#evaluating expressions in print  (# comment line symbol)

my $x = 15;
my $y = 8;
print "the value of x is ", $x , "\n";
print " the new value of x is ", $x + 3, "\n";
print "the sum of x and y is ", $x + $y, "\n";
print "the product of x and y is ", $x*$y, "\n";
