#!/usr/bin/perl

use strict;
use warnings;


print "Enter your age: ";
my $age = <>;

if ($age <= 0) {
print "You do not exist so you can not use a computer.\n";
} 
elsif ($age >= 100) 
       {
             print "you are a little too young to use computers!\n";
        } else 
                {
                      print "You are not to young to use computers\n";
                }
