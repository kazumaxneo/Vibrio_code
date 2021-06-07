#!/usr/bin/perl
use strict;
use List::Util qw/max min/;
use Getopt::Long qw(:config posix_default no_ignore_case gnu_compat);

my $aln = "";
my $output = "seq";
GetOptions('i=s' => \$aln, 'o=s' => \$output);

#usage---------------------------------------------------------------------
print "\nContact\: Kazuma Uesaka \<kazumaxneo\@gmail.com\>\n";
print "Usage\: perl extracct_best_hit.pl -i out -o identity_score\n";
print "Options\:\n";
print "-i needleall output\:\n";
print "-o identity _socre\:\n\n";
#---------------------------------------------------------------------

open INPUT, "<$aln" or die "cant open txt file!\n";
open OUT, ">$output" or die "cant save txt file!\n";
while (my $line = <INPUT>) {
	if($line =~ "\#"){
		$line =~ s/\s//g;
		$line =~ s/\#//g;
		my @array = split(/\:/, $line);
		next unless $array[0] eq "Identity";
		my @array2 = split(/\(/, $array[1]); #extract indeity%
		$array2[1] =~ s/\(//;
		$array2[1] =~ s/\)//;
		$array2[1] =~ s/\%//;
		print OUT "$array2[1]\n";
	}
}

