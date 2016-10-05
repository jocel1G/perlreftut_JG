#/usr/bin/perl
use strict;
use warnings;

# my $filename_source = "C:\\Users\\jocelyn.giraud\\Documents\\PERL\\perlreftut\\folder_file_cities\\folder_file_cities.txt";

# open (my $fh_source, '<', $filename_source) or die "Impossible d'ouvrir le fichier $filename_source en lecture seule";

my %table;
# Other way to write the while block
while (<>)
{
    chomp;
    # Page http://perldoc.perl.org/functions/split.html
    # If only PATTERN is given, EXPR defaults to $_
    my ($city, $country) = split /, /;
    # Due to autovivification, the following line is unnecessary.
    # $table{$country} = [] unless exists $table{$country};
    
    push @{$table{$country}}, $city;
}

for my $country (sort keys %table)
{
    print "$country: ";
    my @cities = @{$table{$country}};
    print join ', ', sort @cities;
    print ".\n";
}