#! /usr/bin/env bash

#bowtie2-build hg19.chr1.fa hg19.chr1
#this builds a bowtie index file from a fasta file

# align hg19.chr1 to the factox fastq file, sort and create bam file
#bowtie2 -x hg19.chr1 -U factorx.chr1.fq \
#    |samtools sort -o factorx.sort.bam

#gives coverage of factorx over genome
#bedtools genomecov -ibam factorx.sort.bam -g hg19.chrom.sizes -bg > factorx.bg

#bedGraphToBigWig factorx.bg hg19.chrom.sizes factorx.bw

# track for UCSC genome browser
# track type=bigWig
# bigDataUrl="http://benoitje.github.io/problem-set-4/data/factorx.bw"
# color=255,0,0 visibility=full name='factorx'

#macs2 callpeak -t factorx.sort.bam -f BAM -n factorxpeakcall

#bedtools slop -i factorxpeakcall_summits.bed -g hg19.chrom.sizes -b 50 > summits_slop.bed

#shuf summits_slop.bed | head -n 1000 > peaks.rand.1000.bed

#bedtools getfasta -fi hg19.chr1.fa -bed peaks.rand.1000.bed -fo peakfactorx.fa

#meme peakfactorx.fa -nmotifs 1 -maxw 20 -minw 8 -maxsize 1000000 -dna

# change directory to cd  meme.out
#meme-get-motif -id 1  < meme_out/meme.txt > out
