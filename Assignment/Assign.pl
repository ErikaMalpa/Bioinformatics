#!/usr/bin/perl
use warnings;
use strict;

#######FIRST PART######
print 'ENTER THE FILENAME OF THE DNA SEQUENCE:= ';
chomp( my $DNAfilename = <STDIN> );

open my $DNAFILE, $DNAfilename or die qq[Cannot open file "$DNAfilename" because: $!];

local $/;
( my $DNA = <$DNAFILE> ) =~ tr/ATCG//cd;


my %codon2aa = qw(
    UCA  S  UCC  S  UCG  S  UCU  S  UUC  F  UUU  F  UUA  L  UUG  L
    UAC  Y  UAU  Y  UAA  _  UAG  _  UGC  C  UGU  C  UGA  _  UGG  W
    CUA  L  CUC  L  CUG  L  CUU  L  CCA  P  CCC  P  CCG  P  CCU  P
    CAC  H  CAU  H  CAA  Q  CAG  Q  CGA  R  CGC  R  CGG  R  CGU  R
    AUA  I  AUC  I  AUU  I  AUG  M  ACA  T  ACC  T  ACG  T  ACU  T
    AAC  N  AAU  N  AAA  K  AAG  K  AGC  S  AGU  S  AGA  R  AGG  R
    GUA  V  GUC  V  GUG  V  GUU  V  GCA  A  GCC  A  GCG  A  GCU  A
    GAC  D  GAU  D  GAA  E  GAG  E  GGA  G  GGC  G  GGG  G  GGU  G
    );
	
print "\nThe original DNA file is:\n$DNA\n\n";

# make a copy of the DNA seq
my $RNAseq = $DNA; 

#Replaces T to U
$RNAseq =~ s/T/U/g;

print "\n\nthe DNA seq is\n$DNA\nthe RNA seq is\n$RNAseq";
#get the compliment of the copy of the primary sequence
my $DNAComplimentseq =~ tr/ATGC/TACG/;
print"The primary sequence is: $DNA\n";
print"The compliment is      : $DNAComplimentseq\n";