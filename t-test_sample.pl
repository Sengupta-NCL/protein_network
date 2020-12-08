#change input/output file paths and names
#change count for number of residues for 1st and 2nd for loop
#one can add separate array for any specific residue pairs


`mkdir 30sample`;
for($k=1;$k<=343;$k++)   # run over number of resiudes
{
	for($l=1;$l<=343;$l++) # run over number of resiudes 
	{
		if($k<$l)
		{
		
		open(OUT,">>30sample/coul-sr-30sample-$k-$l.txt");
		for($i=1;$i<=3;$i++)  # runs over number of replicates of trajectories
		
		{
		open(IN1,"/Path_to_energy_files_.xvg_obtained_from_g_energy_command/Coul-SR_$k-$l\_WT$i.xvg");
		open(IN2,"/Path_to_energy_files_.xvg_obtained_from_g_energy_command/Coul-SR_$k-$l\_V$i.xvg");
		@f1=<IN1>;
		@f2=<IN2>;
#print @f1;
			for($j=119;$j<scalar@f1;$j=$j+100) # $j=$j+100 for 10 sample each from 1000 ns time trajectory output
			{
			#	print $f1[$j];
			$f1[$j]=~/(\S+)\s+(\S+)/g;
			$time=$1;
			$wt=$2;
			$f2[$j]=~/\S+\s+(\S+)/g;
			$v=$1;

			print OUT"$time\t$wt\t$v\n";
			#last;	
			}
			#close(OUT);
	#close(IN1);close(IN2);

		#last;
	
	

		}
	close(OUT);	}
		#	last;
	}
	#last;
}

