#!/usr/bin/bash


#Define necessary variables
input1='/mnt/singularity-test-environment/input/fastqs/81thitakf-110524631622-Tumor_Tissue_RNAlater-RNA_v1_ISTRNARZP_RHGMRNA01292-240821_A01176_BHHL2VDRX5-EXT_LABKA_NGCWGS-NGCWGS00903_GBM00903_L000_R1.fastq.gz'
input2='/mnt/singularity-test-environment/input/fastqs/81thitakf-110524631622-Tumor_Tissue_RNAlater-RNA_v1_ISTRNARZP_RHGMRNA01292-240821_A01176_BHHL2VDRX5-EXT_LABKA_NGCWGS-NGCWGS00903_GBM00903_L000_R2.fastq.gz'
output1='/mnt/singularity-test-environment/output/align_bbduk_pe/testsample1.fastq.gz'
output2='/mnt/singularity-test-environment/output/align_bbduk_pe/testsample2.fastq.gz'
stats='/mnt/singularity-test-environment/output/align_bbduk_pe/stats/testsample.stats.txt'
trim_adapter='/mnt/singularity-test-environment/shared/resources/trim_adapter.fa'
bbmap_sif='/mnt/singularity-test-environment/siffolder/bbmap_38.63.sif'
temp='/mnt/singularity-test-environment/temp/align_bbduk_pe'
log='/mnt/singularity-test-environment/logs/align_bbduk_pe/log-file.txt'

echo "Output1: $output1"
echo "Output2: $output2"

singularity exec --bind /mnt/singularity-test-environment/input/ --bind /mnt/singularity-test-environment/output/align_bbduk_pe --bind /mnt/singularity-test-environment/shared/resources $bbmap_sif \
		 bbduk.sh t=10 in=$input1 in2=$input2 \
		          qin=33 maxcalledquality=70 \
		          ref=$trim_adapter ktrim=r k=23 mink=11 hdist=1 tpe=t tbo=t \
		          trimpolygright=10 \
		          minlen=25 \
		          maxns=30 \
		          entropy=0.5 entropywindow=50 entropyk=5 \
		          stats=$stats \
		          out=$output1 \
			  out2=$output2 \
			  -Xmx15g > /dev/null;
