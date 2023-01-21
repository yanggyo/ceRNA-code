use strict;
use warnings;

my %hash=();

open(RF,"DEmiRNA.txt") or die $!;
while(my $line=<RF>){
	chomp($line);
	$hash{$line}=1;
}
close(RF);

open(RF,"starBase_miRNA.txt") or die $!;
open(WF,">miRNA.txt") or die $!;
while(my $line=<RF>){
	if($.==1){
		print WF $line;
		next;
	}
	my @arr=split(/\t/,$line);
	my @zeroArr=split(/\|/,$arr[0]);
	if(exists $hash{$zeroArr[0]}){
		print WF $line;
	}
}
close(WF);
close(RF);
#split�������ַ���ת��Ϊ����
#$. ǰһ�ζ����ļ�����ĵ�ǰ�к�
#existsһ������������hash�����Ƿ����һ������
#chomp()����ȥ���ַ�����β�Ļ��з�
