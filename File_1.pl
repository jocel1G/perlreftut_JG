#/usr/bin/perl
use strict;
use warnings;

# \ in front of a variable -> reference to that variable
my @array = (1, 9, 6.3);
my %hash = (    "name" => "Toto",
                "address" => "63 Al Street"
);

# from page http://www.perlhowto.com/empty_an_array
# empty array
my @p = ();

my $scalar = 60;

# Making References

# Make Rule 1

my $aref = \@array; # $aref holds a reference to @array
my $href = \%hash; # $href holds a reference to %hash
my $sref = \$scalar; # $sref holds a reference to $scalar

my $xy = $aref; # $xy now holds a reference to @array
$p[3] = $href; # $p[3] now holds a reference to %hash
my $z = $p[3]; # $z now holds a reference to %hash

# Make Rule 2
# [ ITEMS ] makes a new, anonymous array, and returns a reference to that array
my $aref_R2 = [1, "foo", undef, 13];
# $aref_R2 now holds a reference to an array

# { ITEMS } makes a new, anonymous hash, and returns a reference to that hash
my $href_R2 = { 
                APR => 4,
                AUG => 8
           };
# $href_R2 now holds a reference to a hash

# Using References

# Use Rule 1
# Arrays
print @{$aref}[2] . "\n";
if (defined(@{$aref_R2}[2]))
{
    print @{$aref_R2}[2] . "\n";
}
else
{
    print "undef\n";
}
@{$aref_R2}[2] = "jab";
print @{$aref_R2}[2] . "\n";
# Loop through an anonymous array
my @array_for_loop = @{$aref_R2};
for my $element(@array_for_loop)
{
    print "$element\n";
}

# Hashes
print "Hashes\n";
print ${$p[3]}{'name'} . "\n";
print ${$z}{'address'} . "\n";

my @array_of_keys = keys %{$href};
print "Loop Hashes\n\n";
for my $key(@array_of_keys)
{
    print "$key => ${$href}{$key}\n";
    #print "$key\n";
}

# Use Rule 2
print "Use Rule 2\n\n";
# Equivalent to print ${$aref_R2}[3] . "\n";
print $aref_R2->[3] . "\n";
# Equivalent to print ${$z}{'address'} . "\n";
print $z->{address} . "\n";
print $href_R2->{APR} . "\n";

# An example
print "An example\n\n";

my @a = ([1, 2, 3],
         [4, 5, 6],
         [7, 8, 9]);

print $a[1]->[2] . "\n";
print $a[0]->[1] . "\n";

# Arrow Rule
print "\nArrow Rule\n\n";
print $a[1][2] . "\n";
# Same as $a[0]->[1] = 23;
$a[0][1] = 23;
print $a[0][1] . "\n";