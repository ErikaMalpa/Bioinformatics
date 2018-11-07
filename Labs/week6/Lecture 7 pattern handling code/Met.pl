#!/usr/bin/perl
# file size2.pl
#
use strict;
use warnings;

 open MYFILE, "AA_SequenceOnly.Fasta"  or die "Can not find the file ending program!!!!!!!!!!!\n";
 
 my $LineNumber = 0;
 
 while (<MYFILE>)
 {
	chomp;
	$LineNumber++;
	print "An methionine amino acid is found on line $LineNumber\n" if $_ =~ /M/;
	
	#if ($dna =~ /gaatcc/)
	#{
	#	print “An methionine amino acid is found ”
	#}
	
 }
 
 close MYFILE;
	
