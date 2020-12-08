#!/bin/bash
#USAGE: cutoff.sh input_file_name

read -p "input file name: " file

#read -p "P-value cutoff : "  Pval
Pval=0.01
awk '{ if($3< 0.01 ) print $_ }' $file >Pval-cutoff.txt


#read -p "Absolute difference cutoff: "  Abs_diff

# absolute difference cutoff 1kj is given
absdiff=1
awk  '{ if($7> 1 ) print $_ }' Pval-cutoff.txt > Pval$Pval-absdiff$absdiff.txt

awk '{ if($4< $5 ) print $_ }' Pval$Pval-absdiff$absdiff.txt >InteractinInWT.txt 
awk '{ if($5< $4 ) print $_ }' Pval$Pval-absdiff$absdiff.txt >InteractinInVar.txt

rm Pval-cutoff.txt
