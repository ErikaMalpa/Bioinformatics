#!/usr/bin/perl

use strict;
use warnings;

#write to file
open MYFILE2, '>Dna_Seq2.fasta' or die "cannot open file \n";
my $input2 = <MYFILE2>;
chomp $input2;

#Ask user to enter descriptor line
print "Hello please enter a descriptor line \n";
my $descline = <>;
chomp $descline;

#Ask user to add 20 DNA Seq
print "Hello please enter 20 DNA sequenec \n";
my $seq = <>;
chomp $seq;

print MYFILE2 "$descline\n$seq \n";

close MYFILE2;