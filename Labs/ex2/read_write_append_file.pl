#!/usr/bin/perl


use strict;
use warnings;


#  read the file text1.txt ;

	open MYFILE, 'text1.txt' or die " can not open file or file does not exist aborting program!!!!!";

	my $input = <MYFILE>;   #input data from file
	chomp $input;  	
 
	print " the first line of the file is \n\n$input\n\n ";

	close MYFILE;



	
# write your name and address to file text2.txt

	open MYFILE, '>text2.txt' or die "can not open file aborting program!!!!";
 
	# prompt user to input name
	print "enter your name: ";
	my $name = <> ;
	chomp $name;
	
	#prompt user to input address 
	print "\ninput your address and then press return: ";
	chomp( my $address =<>);

	#write the name and address to the file
	print MYFILE "your name is $name\nyour address is $address \n ";
	
	
	close MYFILE;
	
	
	
# open file to confirm age has been written to the file 


    open MYFILE, 'text2.txt' or die " can not open file or file does not exist aborting program!!!!!";

	$name = <MYFILE>;   #input data from file
	chomp $name;

	$address =<MYFILE>;
	chomp $address;

	 
	print " your name is : $name\n"; 
	print " your address is : $address\n\n\n ";
	

	close MYFILE;
	
	
	
	

# Append your age to the text2.txt file 

	open MYFILE, '>>text2.txt' or die "can not open file aborting program!!!!";
 
	# prompt user to input name
	print "enter your age : ";
	my $age = <> ;
	chomp $age;
	

	
	#write data to the file
	print MYFILE "$age\n ";
	
	close MYFILE;
	
	
# open file to confirm age has been written to the file 


    open MYFILE, 'text2.txt' or die " can not open file or file does not exist aborting program!!!!!";

	$name = <MYFILE>;   #input data from file
	chomp $name;

	$address =<MYFILE>;
	chomp $address;

	$age =<MYFILE>;
	chomp $age;
 
	print " your name is : $name\n"; 
	print " your address is : $address\n";
	print " your age is: $age\n";

	close MYFILE;
	


	

	

