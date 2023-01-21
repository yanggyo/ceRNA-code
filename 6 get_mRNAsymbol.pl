open INPUT,"<gene_symbol.txt"||die"can not open";
open OUTPUT,">mRNA_symbol.txt";
while(<INPUT>){
	chomp;
	if($.==1)
	  {
		    print OUTPUT "$_\n";
	  }
	if($_=~m/protein_coding/i)
    {
        print OUTPUT "$_\n";
    }
}	
close(INPUT);
close(OUTPUT);