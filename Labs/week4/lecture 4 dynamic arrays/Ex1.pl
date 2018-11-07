#! /usr/bin/perl    

# The 'pushpop' program - pushing, popping, shifting and unshifting.

@sequences = ( 'TTATTATGTT', 'GCTCAGTTCT', 'GACCTCTTAA', 
                   'CTATGCGGTA', 'ATCTGACCTC' );
    
print "@sequences\n";
$last = pop @sequences;
print "@sequences\n";
$first = shift @sequences;
print "@sequences\n";
unshift @sequences, $last;
print "@sequences\n";
push @sequences, ( $first, $last );    
print "@sequences\n";
@combine = (@sequences, @sequences);
