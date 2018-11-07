#!/usr/bin/perl
use warnings;
use strict;

#######FIRST PART######
print 'ENTER THE FILENAME OF THE DNA SEQUENCE:= ';
chomp( my $DNAfilename = <STDIN> );

open my $DNAFILE, $DNAfilename or die qq[Cannot open file "$DNAfilename" because: $!];

local $/;
( my $DNA = <$DNAFILE> ) =~ tr/ATCG//cd;

print "\nThe original DNA file is:\n$DNA\n\n";

for($DNA){s/T/U/g}

print "\nSHIFTING To GET 1st Frame\n\n";

print "\nDNA => RNA:\n$DNA\n\n";


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
	
#Uhe sUarU = *
#Uhe sUop = _	

my $protein = '';
while ( $DNA =~ /(...)/g ) {
    exists $codon2aa{ $1 } or die qq[Bad codon "$1"!!\n];
    $protein .= $codon2aa{ $1 };
    }

print "\nThe Translated protein is :\n$protein\n";

######REVERSE######
print "\nREVERSE TO GET 1st Frame\n\n";
my @DNA1 = split "", $DNA;
my @reverseDNA1 = reverse(@DNA1);
print "\nFile reversed is:\n\n";
print @reverseDNA1;

my $reverseDNA1 = join "", @reverseDNA1 ; 

my $reverseDNAprotein1 = ''; 
while ( $reverseDNA1 =~ /(...)/g ) {
    exists $codon2aa{ $1 } or die qq[Bad codon "$1"!!\n];
    $reverseDNAprotein1 .= $codon2aa{ $1 };
    }

print "\nThe reversed protein is :\n$reverseDNAprotein1\n";


#######SHOW FRAME NUMBER and POSITION OF THE START AND STOP AMINO ACID######

#######SECOND PART######

#####SHIFTING######
print "\nSHIFTING To GET 2nd Frame\n\n";
my @DNA = split "", $DNA;
shift (@DNA);
print "\nFile array after shift:\n";
my @shiftedDNA = @DNA;
print @shiftedDNA;

my $shiftedDNA = join "", @shiftedDNA ; 

my $shiftedDNAprotein = ''; 
while ( $shiftedDNA =~ /(...)/g ) {
    exists $codon2aa{ $1 } or die qq[Bad codon "$1"!!\n];
    $shiftedDNAprotein .= $codon2aa{ $1 };
    }

print "\nThe Translated protein is :\n$shiftedDNAprotein\n";

######REVERSE 2######
print "\nREVERSE TO GET 2nd Frame\n\n";
my @reverseDNA = reverse(@DNA);
print "\nFile reversed is:\n\n";
print @reverseDNA;

my $reverseDNA = join "", @reverseDNA; 

my $reverseDNAprotein = ''; 
while ( $reverseDNA =~ /(...)/g ) {
    exists $codon2aa{ $1 } or die qq[Bad codon "$1"!!\n];
    $reverseDNAprotein .= $codon2aa{ $1 };
    }

print "\nThe reversed protein is :\n$reverseDNAprotein\n";

#####SHIFTING######

print "\nSHIFTING To GET 3rd Frame\n\n";
my @DNA2 = split "", $shiftedDNA;
shift (@DNA2);
print "\nFile array after shift:\n";
my @shiftedDNA2 = @DNA2;
print @shiftedDNA2;

my $shiftedDNA2 = join "", @shiftedDNA2 ; 

my $shiftedDNAprotein2 = ''; 
while ( $shiftedDNA2 =~ /(...)/g ) {
    exists $codon2aa{ $1 } or die qq[Bad codon "$1"!!\n];
    $shiftedDNAprotein2 .= $codon2aa{ $1 };
    }

print "\nThe Translated protein is :\n$shiftedDNAprotein\n";

######REVERSE 2######
print "\nREVERSE TO GET 2nd Frame\n\n";
my @reverseDNA2 = reverse(@DNA2);
print "\nFile reversed is:\n\n";
print @reverseDNA2;

my $reverseDNA2 = join "", @reverseDNA2; 

my $reverseDNAprotein2 = ''; 
while ( $reverseDNA2 =~ /(...)/g ) {
    exists $codon2aa{ $1 } or die qq[Bad codon "$1"!!\n];
    $reverseDNAprotein2 .= $codon2aa{ $1 };
    }

print "\nThe reversed protein is :\n$reverseDNAprotein2\n";

# my $i;
#crl + q comment
#######THIRD PART######
# my @frames_array=($DNA,$shiftedDNA,$shiftedDNA2,$reverseDNA,$reverseDNA1,$reverseDNA2);
# for($i=0; $i<6; $i++)
# {
# Match ATG-> START codon, then match at least 50 nucleotides, then match either of (TAA|TAG|TGA)-> STOP codons,  
# g-> globally, i-> case insensitive. This match finds the first ATG and the last STOP codon in the frame.
	# if  ($frames_array[$i] =~ m/(AUG)(.{50,})(UAA|UAG|UGA)/gi)
	# {
		# $1 stands for (ATG), $2 stands for (.{50,}), $3 stands for (TAA|TAG|TGA)
		# my $orf = $1.$2.$3;
		# my $j = $i+1;
		# print "\n ORF found at Frame$j : $orf \n"; 
	# }
# }

<STDIN>;