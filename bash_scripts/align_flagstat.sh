#!/usr/bin/bash


#Define necessary variables
input='/mnt/singularity-test-environment/input/240903_NB501792_0591_AHGMFGAFX7-47anthcof-240904T0700NA/ngs_pipeline_workdir/results/alignments/47anthcof-110530629871-Normal_Blood_noinfo-BCM_v4_TwistUDI_X-240903_NB501792_AHGMFGAFX7-RHGM_LABKA_BCM-noinfo.cram'
output='/mnt/singularity-test-environment/output/align_flagstat/result.txt'
samtools_sif='/mnt/singularity-test-environment/siffolder/samtools_1.10.sif'
temp='/mnt/singularity-test-environment/temp/align_flagstat'
log='/mnt/singularity-test-environment/logs/align_flagstat/log-file.txt'
touch $log
chmod 666 $log


singularity exec --bind $input --bind $output $samtools_sif \
	samtools flagstat -@ 4 $input > $output 2> $log;
