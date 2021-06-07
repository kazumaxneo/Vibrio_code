1, Calcurate pairwise ANI using pyani.

    average_nucleotide_identity.py -m ANIb -g -i genome/ -o outdir
    mv outdir/ANIb_percentage_identity.tab ANI.tsv

2, Add "genome" to the first line of the first column of the ANI.tsv file.

  
3, Plot ANI histgram.
    
    #load reshape2
    library("reshape2")
    #input data
    tsv <- read.table("ANI.tsv", header=T, sep="\t")
    reformat <- melt(data = tsv)
    head(reformat)
    
    pdf(file="./ANI_histgram.pdf", width=12, height=8)
    par(las=1,xaxs="i", yaxs="i", cex.main=2, cex.lab=1.5, cex.axis=1.5, font.lab=1, font.axis=1)
    hist(reformat$value, breaks=seq(0.7,1,0.005), main="Histogram", xlab="range", ylim=c(0,2000), col="#333333")
    dev.off()
     




