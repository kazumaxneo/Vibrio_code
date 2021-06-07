#!/usr/bin/perl
use strict;
use List::Util qw/max min/;
use Getopt::Long qw(:config posix_default no_ignore_case gnu_compat);
my $aln = "";
GetOptions('i=s' => \$aln);

open INPUT, "<$aln" or die "cant open txt file!\n";

while (my $line = <INPUT>) {
	chomp($line);
	my @array = split(/\s/, $line) if($line =~ "\>");
	print "$array[0]\n" if($line =~ "\>");
	print "$line\n" unless($line =~ "\>");
}

