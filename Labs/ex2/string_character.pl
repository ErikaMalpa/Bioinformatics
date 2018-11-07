#!/usr/bin/perl

use strict;
use warnings; 

print "are you irish (Y/N): ";
my $irish = <>;
printf "\nwhat county are you from: ";
my $county = <>; 

if ($irish == 'Y') {
print "you are irish ";
print "you are from county: $county\n";
}
