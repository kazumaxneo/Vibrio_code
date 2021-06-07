#!/usr/bin/perl
use strict;
use List::Util qw/max min/;
use Getopt::Long qw(:config posix_default no_ignore_case gnu_compat);
my $aln = "";
GetOptions('i=s' => \$aln);

open INPUT, "<$aln" or die "cant open txt file!\n";

while (my $line = <INPUT>) {
	chomp($line);
	my @array = split(/\_/, $line) if($line =~ "\>");
	my $length = @array;
	if($line =~ "\>"){
		print "$array[0]$array[1]\n" if($length <= 3);
		print "$array[0]$array[1]_$array[2]\n" if($length >= 4);
	}
	print "$line\n" unless($line =~ "\>");
}
