1, Calculate sequence identity between 12 copies of 16S rRNA of strain 138-2 against 16S rRNA copies of Harvey Group vibrios, using needleall's global alignment.  
2, Calculate ANI between 138-2 genome Harvey group genomes, using orthoANI.  
3, Plot ANI and 16S graphs using ggplot2.
    
    
    library(ggplot2)
    input <- read.table("ANI_and_16S", header=T, sep="\t")
    ggplot(input, aes(ANI, rRNA)) + geom_boxplot(width=1, aes(group = cut_width(ANI, 0.5)))




