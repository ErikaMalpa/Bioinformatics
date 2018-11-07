#!/usr/bin/perl


use strict;
use warnings;

	# the descriptor line
    print "The following is an example descriptor line: \n\n"; 
	print ">gi|171361, Saccharomyces cerevisiae, cystathionine gamma-lyase(CYS3) gene, DIT lab, Denis Manley "; 
	
	my $descriptor = ">gi|171361, Saccharomyces cerevisiae, cystathionine gamma-lyase(CYS3) gene, DIT lab, Denis Manley";





# search and replace commands

	# replace the first occurence of a space with an _
	
	my $descriptorcopy = $descriptor;
	$descriptorcopy =~ s/\s/_/;
		
	print "\n\nthe modified decriptor line is:\n$descriptorcopy\n\n"; 
	
	# replace all the spaces with _
	$descriptorcopy = $descriptor;
	$descriptorcopy =~ s/\s/_/g;
		
	print "all spaces replace \n$descriptorcopy"; 
	
	# replace first word with ______
	$descriptorcopy = $descriptor;
	$descriptorcopy =~ s/^\w+/_____/;
	
	print "\n\nthe first word modified decriptor line is:\n$descriptorcopy";
	
	# replace last word with ______
	$descriptorcopy = $descriptor;
	$descriptorcopy =~ s/\w+$/_____/;
	
	print "\n\nthe last word modified decriptor line is:\n$descriptorcopy";

	# replace all words with ______
	$descriptorcopy = $descriptor;
	$descriptorcopy =~ s/\w+/_____/g;	
	print "\n\nthe global word modified decriptor line is:\n$descriptorcopy";
	
	#use search and replace to convert convert DNA to RNA
	
	my $DNAseq = "AAATTGGCCGGTTAATCGTAATGCCCGTAACTT";
		
	# make a copy of the DNA seq
	
	my $RNAseq = $DNAseq; 
	
	$RNAseq =~ s/T/U/g;    #globally replace all T with U
	
	print "\n\nthe DNA seq is\n$DNAseq\nthe RNA seq is\n$RNAseq";
	
	my $DNAComplimentseq = $DNAseq; # make a copy of the primary sequence 
	
	#get the compliment of the copy of the primary sequence
	$DNAComplimentseq =~ tr/ATGC/TACG/;
	print"The primary sequence is: $DNAseq\n";
	print"The compliment is      : $DNAComplimentseq\n";
	
	
	
	
	
	