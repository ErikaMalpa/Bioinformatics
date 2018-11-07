#!/usr/bin/perl
# file size2.pl
#
use strict;
use warnings;


	print "The following is an example descriptor line: \n\n"; 
	print ">gi|171361, Saccharomyces cerevisiae, cystathionine gamma-lyase(CYS3) gene, DIT lab, Denis Manley "; 
	
	my $descriptor = ">gi|171361, Saccharomyces cerevisiae, cystathionine gamma-lyase(CYS3) gene, DIT lab, Denis Manley";

	 
	$descriptor =~ /(\S+)/;
	
	print "the extracted pattern is:  $1";
		
	

	