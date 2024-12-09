#!/usr/bin/bash


#Define necessary variables
input1='/mnt/singularity-test-environment/output/align_bbduk_pe/testsample1.fastq.gz'
input2='/mnt/singularity-test-environment/output/align_bbduk_pe/testsample2.fastq.gz'
output='/mnt/singularity-test-environment/output/hla_t1k_rna'
rna_reference='/mnt/singularity-test-environment/shared/resources/rna_reference.fa'
t1k_sif='/mnt/singularity-test-environment/siffolder/t1k_latest.sif'
temp='/mnt/singularity-test-environment/temp/hla_t1k_rna'
log='/mnt/singularity-test-environment/logs/hla_t1k_rna/log-file.txt'

singularity exec --bind /mnt/singularity-test-environment $t1k_sif /T1K/run-t1k \
		     -t 20 \
		     -1 $input1 \
		     -2 $input2 \
		     -f $rna_reference \
		     -o Tissue_RNA \
		     --preset hla \
		     --od $output
