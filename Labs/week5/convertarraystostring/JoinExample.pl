#!/usr/bin/perl
# file Split_ARRAY.pl


# initalise (populate) an array with DNA sequences
   @sequences = ( 'TTATTATGTT', 'GCTCAGTTCT', 'GACCTCTTAA', 
                  'CTATGCGGTA', 'ATCTGACCTC' );
				  
	
	print " the elements of the array are: \n";
	foreach $element(@sequences)
	{
		print "$element\n";
	}
	

	# join the elements of an array to cinvert the array into a string
	$CombinedSeq = join '', @sequences;   #loin elements of the array.  
	
	# print the string (comined sequence)
	print" the combined sequence is: \n";
	print"$CombinedSeq\n\n";

		
	
	
	
	