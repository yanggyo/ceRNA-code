#install.packages("colorspace")
#install.packages("stringi")
#source("http://bioconductor.org/biocLite.R")
#biocLite("DOSE")
#biocLite("clusterProfiler")
#biocLite("pathview")

setwd("C:\\Users\\lexb4\\Desktop\\geoBatch\\10.GO")
library("clusterProfiler")
library("org.Hs.eg.db")
rt=read.table("id.txt",sep="\t",header=T,check.names=F)
rt=rt[is.na(rt[,"entrezID"])==F,]

geneFC=rt$logFC
gene=rt$entrezID
names(geneFC)=gene

#GO��������
kk <- enrichGO(gene = gene,OrgDb = org.Hs.eg.db, pvalueCutoff =0.05, qvalueCutoff = 0.05)
write.table(kk,file="GO.txt",sep="\t",quote=F,row.names = F)

#��״ͼ
tiff(file="barplot.tiff",width = 20,height = 30,units ="cm",compression="lzw",bg="white",res=300)
barplot(kk, drop = TRUE, showCategory = 47)
dev.off()

#��ͼ
tiff(file="dotplot.tiff",width = 20,height = 30,units ="cm",compression="lzw",bg="white",res=300)
dotplot(kk,showCategory = 47)
dev.off()



###Video source: http://study.163.com/u/biowolf
######Video source: https://shop119322454.taobao.com
######�ٿ�����: http://www.biowolf.cn/
######�������䣺2740881706@qq.com
######����΢��: seqBio
######QQȺ:  259208034