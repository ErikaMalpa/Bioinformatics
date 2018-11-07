#!/usr/bin/perl

use strict;
use warnings;

print "Please enter a file name e.x. Dna_Seq.fasta \n";
open MYFILE, 'Dna_Seq_fasta.pl' or die "cannot open \n";
my $filename = <MYFILE>;
chomp $filename; 

print "the file is \n \n $filename \n \n";


