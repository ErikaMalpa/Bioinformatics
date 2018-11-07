#!/usr/bin/perl

 #while-loops : continue until “condition” is false
 
 use strict;
 use warnings;

 my $count = 0;
  
  print "iteration via a while loop\n\n";
  while ($count <= 5) 
  {
    print "$count potato\n";
    $count = $count + 1;      # increment counter (change condition)
  }

  
  #do – while loops: continue   
	
	
  print "iteration via a do-while loop\n\n";	
  $count = 0; 
  do 
  { 
     print "$count potato\n"; 
     $count = $count + 1;      #increment counter (change condition)
  } while ($count <= 5);  
