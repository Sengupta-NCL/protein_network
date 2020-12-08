#similar to t-test.r script 
#This script calculates t-test between TOTAL energy (COUL+LJ) WT and VAR
#name1,name2 for input files for COUL and LJ
#change input/output file names and path

x<-1:343
out<-c()
for(i in x)
{	for(j in x)
	{
		if(j>i)
		{
			#name<-"coul-sr-30sample-"+i+"-"+j+".txt"
			name1 <-paste0('../30sample/coul-sr-30sample-',i,'-',j,'.txt', collapse = "" )  #paste0('coul-sr-30sample-',i,'-',j,'.txt', collapse = "" )
	#	 	cat(i,"\t", j,"\n")
			name2 <-paste0('../LJ-SR/30sample/lj-sr-30sample-',i,'-',j,'.txt', collapse = "" )
			f1<-read.delim(file=name1,sep="\t", header=F)
			f2<-read.delim(file=name2,sep="\t", header=F)
			wt_cl<-f1[,2]
			v_cl<-f1[,3]
                       wt_lj<-f2[,2]
                        v_lj<-f2[,3]

		       tot_wt<-wt_cl+wt_lj
		       tot_v<-v_cl+v_lj

			#t.test(wt,v)		
			mwt<-mean(tot_wt)
			mv<-mean(tot_v)
			pval<-t.test(tot_wt,tot_v)$p.value
			diff<-mwt-mv
			absdiff<-abs(diff)
			a<-cbind(i,j,pval)	
			out<-rbind(out,a)

			#sink("../pval.txt")	
			cat(i,"\t",j,"\t",pval,"\n")
			line=paste(i,' ',j,' ',pval,' ',mwt,' ',mv,' ',diff,' ',absdiff, collapse = "" )
			write(line,file="30-tot-pval.txt",append=TRUE)
		}
	}
}
#sink("../pval.txt")
#print(out)
#sink()
