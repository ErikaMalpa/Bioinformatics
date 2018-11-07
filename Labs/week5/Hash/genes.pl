#! /usr/bin/perl 

# The 'genes' program - a hash of gene counts.

use strict;
use warnings;



my %gene_counts = ( 'Human'                  => 31000,
                 'Thale cress'          => 26000,
                 'Nematode worm'        => 18000,
                 'Fruit fly'            => 13000,
                 'Yeast'                  => 6000,
                 'Tuberculosis microbe' => 4000 );

print '-', "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX", "\n";

while ( ( my $genome, my $count ) = each %gene_counts )
{
    print "`$genome' has a gene count of $count\n";
}

print '-', "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX", "\n";

foreach my $genome ( sort keys %gene_counts )
{
    print "`$genome' has a gene count of $gene_counts{ $genome }\n";
}

print '-', "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX", "\n";

