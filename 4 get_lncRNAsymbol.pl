open INPUT,"<gene_symbol.txt"||die"can not open";
open OUTPUT,">lncRNA_symbol.txt";
while(<INPUT>){
	chomp;
	if($.==1)
	  {
		    print OUTPUT "$_\n";
	  }
	if($_=~m/sense_overlapping|lincRNA|3prime_overlapping_ncrna|processed_transcript|antisense|sense_intronic/i)
    {
        print OUTPUT "$_\n";
    }
}	
close(INPUT);
close(OUTPUT);