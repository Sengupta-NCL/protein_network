use strict();
use warnings();

#@res has residue id for energy calculations
#$num is starting group for energy calculation (has tobe obtained from g_energy command- groups.)
#$name is name for ouput file
#modify g_energy command for input/output paths
#first for loop with $j run over number of trajectory replicates
#second and third for loop run over @res residues
#
my@res=(110,111,112,113,114,115,116,117,118,119,120,121,122,123,155,156,157,158,159,160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,193,195,199,200,201,202,203,204,205,206,207,208,209,210,211,212,290,"rest");  

my@term=("Coul-SR","LJ-SR","Coul-14","LJ-14");


for(my $j=1; $j<=3;$j++)
{
my$num=50;   

	for(my $i=0; $i<scalar(@res);$i++)
	{
 
		for(my $k=0; $k<scalar@res;$k++)
		{
			if($i<=$k)
			{	
				for(my $l=0; $l<=3;$l++)
				{	
				my$name="$term[$l]_$res[$i]-$res[$k]_WT$j.xvg";	
				print"$term[$l] \t $res[$i]  -\t$res[$k] \t ID $num\n  ";
				
				`echo "$num 0" |g_energy -f 0WT$j\_rerun_2.edr  -o 10of164/$name`;	# -f edr_file -o output_path
				#


				$num++;
			
				}
			}

		}


	
	}
}	
