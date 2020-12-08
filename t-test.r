#This script is for only calculation of t-test for either COUL /LJ interactions between 2 systems WT and var
#x variale run over residue number
#name has input file name
#change input-output file names


x<-1:343
out<-c()
for(i in x)
{	for(j in x)
	{
		if(j>i)
		{
			#name<-"coul-sr-30sample-"+i+"-"+j+".txt"
			name <-paste0('30sample/coul-sr-30sample-',i,'-',j,'.txt', collapse = "" )  #paste0('coul-sr-30sample-',i,'-',j,'.txt', collapse = "" )
	#	 	cat(i,"\t", j,"\n")
			f<-read.delim(file=name,sep="\t", header=F)
			wt<-f[,2]
			v<-f[,3]
			#t.test(wt,v)		
			mwt<-mean(wt)
			mv<-mean(v)
			pval<-t.test(wt,v)$p.value
			diff<-mwt-mv
			absdiff<-abs(diff)
			a<-cbind(i,j,pval)	
			out<-rbind(out,a)

			#sink("../pval.txt")	
			cat(i,"\t",j,"\t",pval,"\n")
			line=paste(i,' ',j,' ',pval,' ',mwt,' ',mv,' ',diff,' ',absdiff, collapse = "" )
			write(line,file="30-coul-pval.txt",append=TRUE)
		}
	}
}
#sink("../pval.txt")
#print(out)
#sink()
