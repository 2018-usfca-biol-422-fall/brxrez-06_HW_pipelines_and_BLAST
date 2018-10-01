#!bin/bash

# A script for a pipeline that will complete downloading 
# data from NCBI through to using BLAST to identify top
# matches in nucleotide database. 

# Brian Rezende
# brezende@dons.usfca.edu 
# September 28, 2018 

# the pipe and tail -n +2 is a handy way to exclude the first line
for SRA_number in $(cut -f 6 data/metadata/fierer_forensic_hand_mouse_SraRunTable.txt | tail -n +2)
do
    fastq-dump -v "$SRA_number" -O data/raw_data
done

#Produce QC output reports to check data quality
#Use FastQC program

fastqc data/raw_data/*.fastq --outdir=output/fastqc

#Create for loop to trim sequences based on quality scores

for file in data/raw_data/*.fastq
do 
#Info on the Trimmomatic tool available here: http://www.usadellab.org/cms/index.php?page=trimmomatic
TrimmomaticSE -threads 2 -phred33 "$file" data/trimmed/"$(basename -s .fastq "$file")".trim.fastq LEADING:5 TRAILING:5 SLIDINGWINDOW:8:25 MINLEN:150
done 

#Convert fastq to fasta files
#Conversion allows for files to be used for BLAST queries

for file in data/trimmed/*.trim.fastq
do 
bioawk -c fastx '{print ">"$name"\n"$seq}' "$file" > output/converted_fasta/"$(basename -s .fastq "$file")".fasta
done 

#Produce BLAST sequence code
echo Blasting ... 
for file in output/converted_fasta/*.fasta
do
 blastn -db /blast-db/nt -num_threads 2 -outfmt '10 sscinames std' -out output/blast_results/"$(basename -s .fasta "$file")"_blast_results.csv -max_target_seqs 1 -negative_gilist /blast-db/2018-09-19_environmental_sequence.gi -query "$file"
done 

#Show that BLAST is FINALLY complete 
echo Blast complete. Yay. 

