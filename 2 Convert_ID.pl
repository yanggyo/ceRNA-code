use strict;
use warnings;

my $gtfFile=$ARGV[0];
my $expFile=$ARGV[1];
my $outFile=$ARGV[2];

my %hash=();
my %repHash=();
my %proteinHash=();
open(RF,"$gtfFile") or die $!;
while(my $line=<RF>)
{
	chomp($line);
	if($line=~/gene_id \"(.+?)\"\;.+gene_name "(.+?)"\;.+gene_biotype \"(.+?)\"\;/)
	{
									my $ensembl=$1;
									my $geneName=$2;
									my $biotype=$3;
		      $hash{$ensembl}=$geneName . "|" . $ensembl . "|" . $biotype;
								${$repHash{$geneName}}{$ensembl}=$biotype;
								if($biotype eq "protein_coding"){
																$proteinHash{$geneName}=1;
								}
	}
}
close(RF);

foreach my $key(keys %repHash){
								my $repLength=keys %{$repHash{$key}};
								if(($repLength>1) && (exists $proteinHash{$key})){
																foreach my $repKey(keys %{$repHash{$key}}){
																								if(${$repHash{$key}}{$repKey} ne "protein_coding"){
																																print ${$repHash{$key}}{$repKey} . "\n";
																																delete($hash{$repKey});
																								}
																}
								}
}

open(RF,"$expFile") or die $!;
open(WF,">$outFile") or die $!;
while(my $line=<RF>)
{
	if($.==1)
	{
		print WF $line;
		next;
	}
	chomp($line);
	my @arr=split(/\t/,$line);
	$arr[0]=~s/(.+)\..+/$1/g;
	if(exists $hash{$arr[0]})
	{
		$arr[0]=$hash{$arr[0]};
		print WF join("\t",@arr) . "\n";
	}
}
close(WF); 
close(RF);

