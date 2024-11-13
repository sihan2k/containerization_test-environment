#!/usr/bin/bash


#Define necessary variables
input1='/mnt/singularity-test-environment/input/240903_NB501792_0591_AHGMFGAFX7-47anthcof-240904T0700NA/fastqs/47anthcof-110530629871-Normal_Blood_noinfo-BCM_v4_TwistUDI_X-240903_NB501792_AHGMFGAFX7-RHGM_LABKA_BCM-noinfo_R1.fastq.gz'
input2='/mnt/singularity-test-environment/input/240903_NB501792_0591_AHGMFGAFX7-47anthcof-240904T0700NA/fastqs/47anthcof-110530629871-Normal_Blood_noinfo-BCM_v4_TwistUDI_X-240903_NB501792_AHGMFGAFX7-RHGM_LABKA_BCM-noinfo_R2.fastq.gz'
output1='/mnt/singularity-test-environment/output/align_bbduk_pe/testsample1.fastq.gz'
output2='/mnt/singularity-test-environment/output/align_bbduk_pe/testsample2.fastq.gz'
stats='/mnt/singularity-test-environment/output/align_bbduk_pe/stats/testsample.stats.txt'
trim_adapter='/mnt/singularity-test-environment/shared/resources/trim_adapter.fa'
bbmap_sif='/mnt/singularity-test-environment/siffolder/bbmap_38.63.sif'
temp='/mnt/singularity-test-environment/temp/align_bbduk_pe'
log='/mnt/singularity-test-environment/logs/align_bbduk_pe/log-file.txt'
touch $log $output1 $output2 $stats
chmod 666 $input1 $input2 $output1 $output2 $stats $temp $log

singularity exec --bind /mnt/singularity-test-environment/input/ --bind /mnt/singularity-test-environment/output/align_bbduk_pe --bind /mnt/singularity-test-environment/shared/resources $bbmap_sif \
		 bbduk.sh t=10 in1=$input1 in2=$input2 \
		# UMI support
		          qin=33 maxcalledquality=70 \
		# Adapter trimming
		          ref=$trim_adapter ktrim=r k=23 mink=11 hdist=1 tpe=t tbo=t \
		# Poly-G trimming
		          trimpolygright=10 \
		# Length filtering
		          minlen=25 \
		# Missing bases filtering
		          maxns=30 \
		# Entropy filtering
		          entropy=0.5 entropywindow=50 entropyk=5 \
		# Output
		          stats=$stats \
		          out1=$output1 \
		          out2=$output2 \
		          2> $log
