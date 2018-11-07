############################# PART 1 #############################

my @file1_array;
my @file2_array;
my $FILE1LOCATION = 'file1.fasta';
my $FILE2LOCATION = 'file2.fasta';

open FILE1, $FILE1LOCATION, or die "Error opening file 1";
open FILE2, $FILE2LOCATION, or die "Error opening file 2";

while(<FILE1>){
    chomp;
    push @file1_array, $_;
}

@file2_array = <FILE2>;

close FILE1;
close FILE2;

print "\nFile 1 array\n\n";
print @file1_array;
print "\n\nFile 2 array\n\n";
print @file2_array;
print "\n";

shift @file1_array;
shift @file2_array;

print "File 2 array after shift: \n\n";
print @file2_array;

my @reverse = reverse(@file2_array);
print "\nFile 2 array reversed is:\n\n";
print @reverse;

my @merged = (@file1_array, chomp(@file2_array));

open FILE, ">", "./lecture 4 dynamic arrays/file3.fasta", or die "Could not open file 3";
print FILE @merged;
close FILE;

######################################   PART 2 ##########################################

my $data_dir = './lecture 4 dynamic arrays/';

print "\nEnter file to read into array\n\n";
chomp(my $user_file_name = <>);

my @data;
open FILE, $data_dir.$user_file_name, or die "could not open file";
while(<FILE>){
    chomp;
    push @data, $_;
}
close FILE;

print "\nEnter 3 sequences to append to the data\n\n";
for(my $i=0; $i<3; $i++) {
    print "Next Sequence\n";
    chomp(my $seq = <>);
    push @data, $seq;
}

@data = sort(@data);
@data = reverse(@data);

print "Enter Name and Place of Work\n";
chomp(my $descriptor = <>);
unshift @data, $descriptor;

my $num_lines = 0;
my $num_chars = 0;
open FILE, ">", $data_dir."new_file.fasta" or die "could not create or open new_file.fasta";
foreach my $line(@data) {
    $num_lines++;
    $num_chars += length $line;
    print FILE $line."\n";
}
close FILE;

print "\n$num_lines lines in file\n";
print "\n$num_chars characters in file\n";
