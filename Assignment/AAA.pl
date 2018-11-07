#!/usr/bin/perl -w
###https://www.biotechnologyforums.com/thread-7910.html
use strict;
my ($file,$line,$dna,$revcom,$i,$codon,@frames_array,$j,$orf);
my ($frame1,$frame2,$frame3,$frame4,$frame5,$frame6)='';

print "Enter the filename: ";
$file = <STDIN>;
chomp $file;
open (FILE, $file) or
die "Cannot open file : $file \n\n";
while ($line = <FILE>)
{ 
if ($line =~ /^#/ )
{ next; } 
elsif($line =~ /^>/ )
{ next; }
else
{ $dna .= $line; }
}
$dna =~ s/\s//g ;
close FILE;

print "Original Sequence is: $dna \n";

# Assigning 3 frames for the forward strand
for ($i=0; $i<length($dna)-2; $i+=3)
{
$codon = substr($dna,$i,3);
$frame1 .=$codon;
}

for ($i=1; $i<length($dna)-2; $i+=3)
{
$codon = substr($dna,$i,3);
$frame2 .=$codon;
}

for ($i=2; $i<length($dna)-2; $i+=3)
{
$codon = substr($dna,$i,3);
$frame3 .=$codon;
}

# Assigning 3 frames for the reverse complementary strand
$revcom = reverse($dna);
$revcom =~ tr/AaTtGgCc/TtAaCcGg/; 

for ($i=0; $i<length($revcom)-2; $i+=3)
{
$codon = substr($revcom,$i,3);
$frame4 .=$codon;
}

for ($i=1; $i<length($revcom)-2; $i+=3)
{
$codon = substr($revcom,$i,3);
$frame5 .=$codon;
}

for ($i=2; $i<length($revcom)-2; $i+=3)
{
$codon = substr($revcom,$i,3);
$frame6 .=$codon;
}

print "Frame1: $frame1 \nFrame2: $frame2 \nFrame3: $frame3 \nFrame4: $frame4 \nFrame5: $frame5 \nFrame6: $frame6 \n" ;
@frames_array=($frame1,$frame2,$frame3,$frame4,$frame5,$frame6);
# Perl assigns the first element of the array at 0th position
for($i=0; $i<6; $i++)
{
# Match ATG-> START codon, then match at least 50 nucleotides, then match either of (TAA|TAG|TGA)-> STOP codons,  
# g-> globally, i-> case insensitive. This match finds the first ATG and the last STOP codon in the frame.
if  ($frames_array[$i] =~ m/(ATG)(.{50,})(TAA|TAG|TGA)/gi)
{
# $1 stands for (ATG), $2 stands for (.{50,}), $3 stands for (TAA|TAG|TGA)
$orf = $1.$2.$3;
$j = $i+1;
print "\n ORF found at Frame$j : $orf \n"; 
}
}