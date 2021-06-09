1, Extract rRNA sequences from each assembly sequence using barrnap.

    barrnap --outseq rRNAs.fa --threads 6 genome.fasta > rRNAs.gff
    #extract 23S from "rRNAs.fa"
    seqkit grep -r -p ^16S rRNAs.fa > 16S
    
2, Do all versus all pairwise alignment  
    
    
    needleall 16S.fasta 16S.fasta out -gapopen 10.0 -gapextend 0.5 -aformat pair && perl extracct_best_hit.pl -i out -o identity_score
    needleall 16S.fasta 16S.fasta simple -auto
    
    echo genome1 genome2 identity |sed s/' '/$'\t'/g > temp && paste -d "\t" simple identity_score |sed s/' '/$'\t'/g |cut -f 1,2,5 >> temp 
    head -n -2 temp > 16S_pairwise_sequence_identity 
    
This process was run for all the genomes and the results were concatenated. The results were then plotted in a vertical graph using BoxPlotR (http://shiny.chemgrid.org/boxplotr/).



