#!/usr/bin/bash


#Define necessary variables
input1='/mnt/singularity-test-environment/output/align_bbduk_pe/testsample1.fastq.gz'
input2='/mnt/singularity-test-environment/output/align_bbduk_pe/testsample2.fastq.gz'
output='/mnt/singularity-test-environment/output/align_bwa_mem/bwa_mem.sam'
human_reference='/mnt/singularity-test-environment/shared/resources/bwa/human_ref.fasta'
bwa_sif='/mnt/singularity-test-environment/siffolder/bwa_0.7.18.sif'
temp='/mnt/singularity-test-environment/temp/align_bwa_mem'
log='/mnt/singularity-test-environment/logs/align_bwa_mem/log-file.txt'


singularity exec --bind /mnt/singularity-test-environment $bwa_sif \
		bwa mem \
		     -t $((32-3)) \
		     -R '@RG\tID:A00559_765_HL7GHDSXC_1\tPL:ILLUMINA\tPU:HL7GHDSXC_1\tLB:X\tSM:96igonfsf-110443926154-Tumor_Blood_cfDNA-TSO500_v1_TSO500CTv2_X-240830_A00559_AHL7GHDSXC-EXT_LABKA_PR154-noinfo\tCN:RH-GM' \
		     -Y -K 100000000 \
		     $human_reference \
		     $input1 $input2 \
		     > $output
