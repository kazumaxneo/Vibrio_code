#!/usr/bin/perl
use strict;
use List::Util qw/max min/;
use Getopt::Long qw(:config posix_default no_ignore_case gnu_compat);
my $aln = "";
GetOptions('i=s' => \$aln);

open INPUT, "<$aln" or die "cant open txt file!\n";



my $i = 0;
while (my $line = <INPUT>) {
	my $line2 = <INPUT>;
	chomp($line);
	my @array = split(/\>/, $line);
	print ">$array[0]$array[1]\n" if($line =~ "\>");
	print "$line2" unless($line2 =~ "\>");
	$i++;
}

