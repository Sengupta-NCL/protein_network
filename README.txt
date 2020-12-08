Instructions for scripts usage to build perturbed energy network for 2 systems.
system1: Wild type (WT)
system2: Variant (Var)


1. make index file for residues for which energy calculations are required.(gromacs command: make_ndx)

2. Add option 'energygrps' to mdp file with the same residue indices
#this residue list can vary from gromacs version to version Gromacs-4.xx can take upto 252, gromacs-5.xx takes only 64.
#Accordingly one can make multiple mdp files to get all energygroup residues coverd in the energy calculations.

3. "rerun" the simulation using this new mdp files and writeout "edr" files. (gromacs command: mdrun)

4. Listout the index numbers of groups for which energy calculations are required. Use "g_energy/gmx energy" command for it.

5. use sample script "energy-cal.pl" to get all energy calculations.
#change file names and paths for the input/output data
#change the initial group number to start the energy calculation according to your g_energy output.

6.For comparision of 2 systems eg Wild type and Variant, one can use these energy calculations to build perturbed energy networks.
Using script "t-test-samples.pl" extract out the sample points from "energy.xvg" file (output from energy-cal.pl) for both systems.

7.Using "t-test.r" R script one can get dat output file with columns as follows
residue1, residue2, Pvalue, WT_average, Var_average, difference, absolute_difference
#Pvalue is obtained by performing t-test on the provides sample points of both systems.
 Pvalue<0.05 :95% confidence of two systems being different from each other
 Pvalue<0.01 :99% confidence of two systems being different from each other
#WT_average : average value for WT system over provided data points
#Var_average : average value for Var system over provided data points
#difference : Difference between WT_average and Var_average (WT-Var)
#absolute_difference :absolute value of the difference

#Sample output file for t-test scripts : SampleFile.txt

8. Get output file with different cutoffs on columns mentioned above, using script "cutoff.sh"
#user can modify the cutoff values in file
#Output files has all same columns mentioned above with provided cutoffs
1.Pval0.01-absdiff1.txt: Pvalue <0.01 and absolute_difference >1kJ
2.InteractionInWT.txt : With given cutoffs favourable interaction in WT
3.InteractionInVar.txt : With given cutoffs favourable interaction in Var

9. Use the cutoff provided output file to build the network using cytoscape tool and analyse it.
# https://cytoscape.org/
