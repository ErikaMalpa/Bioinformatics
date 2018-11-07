#!/usr/bin/perl

use strict;
use warnings;

#read the file
open MYFILE, 'Dna_Seq.fasta' or die "can not open \n";
my $input = <MYFILE>; 
chomp $input;
print "File: \n $input\n";
close MYFILE;

#write the file
open MYFILE, '>>Dna_Seq.fasta' or die "can not open \n";

#Ask user to enter 20 data sequence
print "Enter 20 data sequence: ";
my $user_input = <>;
chomp $user_input;

print MYFILE "$user_input";

close MYFILE;