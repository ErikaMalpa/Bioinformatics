#!/usr/bin/perl

print "content-type: text/html \n\n"; #HTTP HEADER

# DEFINED STRINGS
$astring = "Rain-Drops-On-Roses-And-Whiskers-On-Kittens";
$namelist = "Larry,David,Roger,Ken,Michael,Tom";

# STRINGS ARE NOW ARRAYS
@array = split('-',$astring);
@names = split(',',$namelist);

# PRINT THE NEW ARRAYS
print @array."<br />";
print "@names";

#!/usr/bin/perl

print "content-type: text/html \n\n"; #HTTP HEADER

# A COUPLE OF ARRAYS
@array = ("David","Larry","Roger","Ken","Michael","Tom");
@array2 = qw(Pizza Steak Chicken Burgers);

# JOIN 'EM TOGETHER
$firststring = join(", ",@array);
$secondstring = join(" ",@array2);

# PRINT THE STRINGS
print "$astring<br />";
print "$string";