#!/usr/bin/perl 
#translate.pl -- translate nucleic acid sequence to protein sequence
#                according to standard genetic code

use strict;
use warnings;

#   process input data

while (my $line = <DATA>) {                           # read in line of input
   
	# reading frame
	print "$line";                                       # transcribe to output
    chomp $line;   
    # remove end-of-line character
    my @triplets = unpack("a3" x (length($line)/3), $line); # pull out successive triplets
    foreach my $codon (@triplets) {                         # loop over triplets
        print "$codon\n";            # print out translation of each
    }                                                    # end loop on triplets
    print "\n\n Reading frame shifted one position to the right\n";  
	
	
	
	# reading frame shitfed one position to the right
	@triplets = unpack('a1'."a3" x (length($line)/3), $line); # pull out successive triplets starting at base number 2
    foreach my $codon (@triplets) {                         # loop over triplets
        print "$codon\n";            # print out translation of each
    }                                                    # end loop on triplets
    print "\n\n";
	
	
                                         # skip line on output
}                                                        # end loop on input lines

# what follows is input data

__END__
atgcatccctttaat
tctgtctga
