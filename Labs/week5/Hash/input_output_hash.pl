#! /usr/bin/perl

# input_output_hash.pl

use strict;
use warnings;



 # add values to the hash table 
my %oligos = ();
$oligos{'192a8'} = 'GGGTTCCGATTTCCAA';
$oligos{'18c10'} = 'CTCTCTCTAGAGAGAGCCCC';
$oligos{'327h1'} = 'GGACCTAACCTATTGGC';

 # print enteries in the hash table
print "\n\noligo 18c10 is $oligos{'18c10'}\n";
print "\noligo 192a8 is ",length $oligos{'192a8'}," base pairs long\n\n\n\n";
my $s = $oligos{'192a8'};   # assign a value from the hash
print "oligo 192a8 is $s\n\n\n\n";

# to determine the number of enteries in the table
	my $size = keys %oligos;
	print "the number of enteries in the table are: $size\n\n\n"; 
