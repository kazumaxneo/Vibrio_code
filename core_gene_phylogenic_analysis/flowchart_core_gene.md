1, Find core gene-set using orthoMCL algorithm of get homologues package

    perl get_homologues.pl -d Vibrio_genome_dir/ -M -t 37 -e -n 12
    
2, Rename header
    
    
    #rename header
    cd <change>/<to>/<get_homologues>/<output>/<xxx_algOMCL_e1_>/
    ls *faa > list
    mkdir rename
    cat ./list | while read line; do
	    folder=${line%.faa}
	    perl rename.pl -i ${line} >> rename/${folder}.faa
    done
    cd rename/

3, Create direcotry   

    mkdir 1_raw
    mkdir 2_Trimmed
    mkdir 3_long_MSA


4, Run multiple sequence alignment and trim poorly aligned region, and filter short MSA(<250a.a).

	count=1
	for file in `\find *faa -maxdepth 1 -type f`; do
		input=${file}
		out=${file%rename.faa}.aln.fa
		out2=${out%.aln.fa}_trimmed.fa
		out3=${out2%_trimmed.fa}
		
		#MSA
		muscle -in $input -out 1_raw/$out
		
		#Trimming poorly aligned region
		trimal -in 1_raw/$out -out 2_Trimmed/$out2 -gt 0.9 -cons 30 -keepheader
	
		# ≥250a.a and rename header
		seqkit seq -m 250 2_Trimmed/$out2  |sed s/$'Vibrio'/'V.'/g | sed s/$'\['/''/g | sed s/$'\]'/'_'/g | sed s/$' '/''/g | sed s/$'.sp'/''/g | seqkit rename | seqkit sort -n - | awk '/^>/ { if(NR>1) print "";  printf("%s\n",$0); next; } { printf("%s",$0);}  END {printf("\n");}' - >  3_long_MSA/$out3

		count=$(expr $count + 1)
	done
	

5, Rename header and concatenate MSA

    cd 3_long_MSA
    find ./ -size 1 -delete
    for file in `\find *faa -maxdepth 1 -type f`; do
        folder=${file%.aln}
        perl header.pl -i ${file} >> ${folder}_rename
    done
    
    mkdir original && mv *faa original/
    paste -d " " *_rename | sed s/$' '/''/g | perl header2.pl -i - > MSA.fa
    


6, Run iqtree

    
    iqtree -s MSA.fa -b 100 -nt 60 -m MFP









