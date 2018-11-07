#!/usr/bin/perl
# file Split_ARRAY.pl

use strict;
use warnings; 



# the substring example: this shows the function of the function SubString...


    my $s = "The black cat climbed the green tree";
    my $colour = substr $s, 4, 5; # black
    my $middle = substr $s, 4, -11; # black cat climbed the
    my $end = substr $s, 14; # climbed the green tree
    my $tail = substr $s, -4; # tree
    my $z = substr $s, -4, 2; # tr

	print "$s\n$colour\n$middle\n$end\n$tail\n$z\n"; 

	