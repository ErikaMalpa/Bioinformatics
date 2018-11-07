#! /usr/bin/perl

use strict;
use warnings;

my @file = ('file1.fasta','file1.fasta');
open (my $FH, '<', $file) or die "Can't open '$file' for read: $!";
my @lines;
while (my $line = <$FH>) {
    push (@lines, $line);
}
close $FH or die "Cannot close $file: $!";

print @lines;