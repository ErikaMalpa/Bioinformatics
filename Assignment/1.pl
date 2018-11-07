#!/usr/bin/perl -w

use strict;

print "Enter the DNA sequence \n";
$dna = <STDIN>;
chomp($dna);

$frame1 ="";
for ($i=0; $i<length($dna)-3; $i+=3)
{
	$codon = substr($dna,$i,3);
	$frame1 .=$codon;
}
$frame2 ="";
for ($i=1; $i<length($dna)-3; $i+=3)
{
	$codon = substr($dna,$i,3);
	$frame2 .=$codon;
}

$frame3 ="";
for ($i=2; $i<length($dna)-3; $i+=3)
{
	$codon = substr($dna,$i,3);
	$frame3 .=$codon;
}

$revdna= reverse($dna);
$revdna =~ tr/AaTtGgCc/TtAaCcGg/; 

$frame4 ="";
for ($i=0; $i<length($revdna)-3; $i+=3)
{
	$codon = substr($revdna,$i,3);
	$frame4 .=$codon;
}
$frame5 ="";
for ($i=1; $i<length($revdna)-3; $i+=3)
{
	$codon = substr($revdna,$i,3);
	$frame5 .=$codon;
}

$frame6 ="";
for ($i=2; $i<length($revdna)-3; $i+=3)
{
	$codon = substr($revdna,$i,3);
	$frame6 .=$codon;
}

@frames=($frame1,$frame2,$frame3,$frame4,$frame5,$frame6);

for($i=1; $i<7; $i++)
{
	if  ($frames[$i] =~m/(ATG)(.{5,})(TAA|TAG|TGA)/gi)
	{
		print "\n\n ORF found at frame$i  :";
		my $orf = my$1.$2.$3;
		print "$orf \n\n";
		
	}
}
