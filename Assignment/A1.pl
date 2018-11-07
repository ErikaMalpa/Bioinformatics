#!/usr/bin/perl -w
use strict;
#ORF_Find.txt -> finds long orfs in a DNA sequence
##https://stackoverflow.com/questions/32483624/open-reading-frame-program-not-printing-amino-acid-sequences


open(CHROM, "ecoli.fasta");   #Open file chr03.txt containing yeastchrom. 3
$DNA = "";                          #start with empty DNA sequence
$header = <CHROM>;                  #get header of sequence

#Read line from file, join to end of $DNA, repeat until end of file

while ($current_line = <CHROM>)
{
    chomp($current_line);           #remove newline from end of current_line
    $DNA= $DNA . $current_line;
}

#length of DNA sequence
$DNA_length = length($DNA);

#flag for ORF finder
$inORF=0;

#number of ORFs found
$numORFs = 0;

#minimum length
$minimum_codons =100;

#search each reading frame
for ($frame =0; $frame<3; $frame++)
{
    print "\nFinding ORFs in frame: +" . ($frame + 1) . "\n";

    #search for sequence match and print position of match if found
    for ($i =frame; $i<=($DNA_length-3);$i += 3)
    {
        #get current codon from sequence
        $codon= substr ($DNA, $i, 3);

        #if not in orf search for ATG, else search for stop codon
        if ($inORF == 0)
        {
            #if current codon is ATG, start ORF
            if ($codon eq "ATG")
            {
                $inORF = 1;
                $ORF_length = 1;
                $ORF_start = $i;
            }
        }
        elsif($inORF ==1)
        {
            #if current codon is a stop codon, end ORF
            if ($codon eq "TGA" || $codon eq "TAG" || $codon eq "TAA")
            {
                #if ORF has at least min number of codons,print location
                if ($ORF_length >= $minimum_codons)
                {
                    print "FOUND ORF AT POSITION $ORF_start,";
                    print "length = $ORF_length\n";
                    $numORFs++;
                }

                #reset ORF variables
                $inORF = 0;
                $ORF_length = 0;
            }
            else
            {
                #increase length of ORF by one codon
                $ORF_length++;
            }
        }
    }
}

#change T to U
$DNA =~ s/T/U/g;

#search each ORF
for ($i=$ORF_start; $i<=($ORF_length-3); $i+=3)
{
    #get codon from each ORF
    $aa_codon= substr($DNA, $i, 3);

    #find amino acids
    foreach ($aa_codon eq "ATG")
    {
        print ("M")     #METHIONINE
    }
    foreach ($aa_codon =~/UU[UC]/)
    {
        print ("F")     #PHENYLALANINE
    }
    foreach ($aa_codon =~/UU[AG]/ || $aa_codon=~/CU[UCAG]/)
    {
        print ("L");    #LEUCINE
    }
    foreach ($aa_codon =~/AU[UAC]/)
    {
        print ("I");    #ISOLEUCINE
    }
    foreach ($aa_codon =~/GU[UACG]/)
    {
        print ("V");    #VALINE
    }
    foreach ($aa_codon =~/UC[UCAG]/ || $aa_codon=~/AG[UC]/)
    {
        print ("S");    #SERINE
    }
    foreach ($aa_codon =~/CC[UCAG]/)
    {
        print ("P");    #PROLINE
    }
    foreach ($aa_codon =~/AC[UCAG]/)
    {
        print ("T");    #THREONINE
    }
    foreach ($aa_codon =~/GC[UCAG]/)
    {
        print ("A");    #ALANINE
    }
    foreach ($aa_codon =~/UA[UC]/)
    {
        print ("Y");    #TYROSINE
    }
    foreach ($aa_codon =~/CA[UC]/)
    {
        print ("H");    #HISTIDINE
    }
    foreach ($aa_codon =~/CA[AG]/)
    {
        print ("G");    #GLUTAMINE
    }
    foreach ($aa_codon =~/AA[UC]/)
    {
        print ("N");    #ASPARAGINE
    }
    foreach ($aa_codon =~/AA[AG]/)
    {
        print ("K");    #LYSINE
    }
    foreach ($aa_codon =~/GA[UC]/)
    {
        print ("D");    #ASPARTIC ACID
    }
    foreach ($aa_codon =~/GA[AG]/)
    {
        print ("E");    #GLUTAMIC ACID
    }
    foreach ($aa_codon =~/UG[UC]/)
    {
        print ("C");    #CYSTINE
    }
    foreach ($aa_codon eq "UGG")
    {
        print ("W");    #TRYPTOPHAN
    }
    foreach ($aa_codon =~/AG[AG]/ || $aa_codon =~/CG[UCAG]/)
    {
        print ("R");    #ARGININE
    }
    foreach ($aa_codon =~/GG[UCAG]/)
    {
        print ("G");    #GLYCINE
    }
    foreach ($aa_codon =~/UA[AG]/|| $aa_codon eq "UGA")
    {
        print ("*")     #STOP
    }

}
#if no ORFS found, print message
if ($numORFs ==0)
{
    print ("NO ORFS FOUND\n");
}
else
{
    print ("\n$num_ORFs ORFS WERE FOUND\n");
}
