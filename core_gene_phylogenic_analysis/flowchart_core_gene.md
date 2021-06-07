1, get homologueでコアタンパク質セットを計算。

    perl get_homologues.pl -d Vibrio_genome_dir/ -M -t 37 -e -n 12
    
2, Rename header
    
    
    #rename header
    cd <change>/<to>/<get_homologues>/<output>/<xxx_algOMCL_e1_>/
    ls *faa > list
    mkdir rename
    cat ./list | while read line; do
    done
    cd rename/

3, Create direcotry   

    mkdir 1_raw
    mkdir 2_Trimmed
    mkdir 3_long_MSA


4, Run multiple sequence alignment and trim poorly aligned region, and filter short MSA.

		
		#Trimming poorly aligned region

	

5, Rename header and concatenate MSA

    cd 3_long_MSA
    for file in `\find *faa -maxdepth 1 -type f`; do
        folder=${file%.aln}
        perl header.pl -i ${file} >> ${folder}_rename
    done
    
    mkdir original && mv *faa original/
    paste -d " " *_rename | sed s/$' '/''/g | perl header2.pl -i - > MSA.fa
    


6, Run iqtree

    
    iqtree -s MSA.fa -b 100 -nt 60 -m MFP








