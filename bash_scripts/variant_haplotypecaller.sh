#!/usr/bin/bash


#Define necessary variables
input1='/mnt/singularity-test-environment/input/haplotypecaller/76wiavesm-110529303305-Normal_Blood_noinfo-BCM_v4_TwistUDI_X-240903_NB501792_AHGMFGAFX7-RHGM_LABKA_BCM-noinfo.cram'
output='/mnt/singularity-test-environment/output/haplotypecaller'
human_reference='/mnt/singularity-test-environment/shared/resources/human_ref.fasta'
dbsnp='/mnt/singularity-test-environment/shared/resources/common_all_20180418_chr.vcf.gz'
gatk_sif='/mnt/singularity-test-environment/siffolder/gatk_4.2.6.1.sif'
temp='/mnt/singularity-test-environment/temp/haplotypecaller'
log='/mnt/singularity-test-environment/logs/haplotypecaller/log-file.txt'

singularity exec --bind /mnt/singularity-test-environment $gatk_sif \
		 gatk --java-options '-Xmx40g' HaplotypeCaller \
		      -R $human_reference -I $input1 \
		      --dbsnp $dbsnp \
		      --emit-ref-confidence GVCF \
		      --bam-output $output/bamfile.bam \
		      -O $output/vcffile.g.vcf.gz;
