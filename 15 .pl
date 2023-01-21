use strict;
use warnings;

my %hash=();

open(RF,"DEmRNA.txt") or die $!;
while(my $line=<RF>){
	chomp($line);
	$hash{$line}=1;
}
close(RF);

open(RF,"miRNA_Target.txt") or die $!;
open(WF,">miRNA_mRNA.txt") or die $!;
while(my $line=<RF>){
	if($.==1){
		print WF $line;
		next;
	}
	my @arr=split(/\t/,$line);
	my @zeroArr=split(/\|/,$arr[1]);
	if(exists $hash{$zeroArr[0]}){
		print WF $line;
	}
}
close(WF);
close(RF);
