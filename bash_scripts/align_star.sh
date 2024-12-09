#!/usr/bin/bash


#Define necessary variables
input1='/mnt/singularity-test-environment/output/align_bbduk_pe/testsample1.fastq.gz'
input2='/mnt/singularity-test-environment/output/align_bbduk_pe/testsample2.fastq.gz'
output='/mnt/singularity-test-environment/output/align_star'
star_index='/mnt/singularity-test-environment/shared/resources/star_index'
gtf='/mnt/singularity-test-environment/shared/resources/GCF_000001405.39_GRCh38.p13_no_alt_analysis_set_ucsc_style_name.maskedGRC_exclusions.no_unknown_transcript.gtf'
star_sif='/mnt/singularity-test-environment/siffolder/star_2.7.10a.sif'
temp='/mnt/singularity-test-environment/temp/star'
log='/mnt/singularity-test-environment/logs/star/log-file.txt'
ID:A01176_584_HHL2VDRX5_1 PL:ILLUMINA PU:HHL2VDRX5_1 LB:NA SM:81thitakf-110524631622-Tumor_Tissue_RNAlater-RNA_v1_ISTRNARZP_RHGMRNA01292-240821_A01176_BHHL2VDRX5-EXT_LABKA_NGCWGS-NGCWGS00903_GBM00903 CN:RH-GM

rm -rf $temp;

singularity exec --bind /mnt/singularity-test-environment $star_sif \
		 STAR --runThreadN 14 --genomeDir $star_index \
		      --sjdbGTFfile $gtf \
		      --sjdbOverhang 149 \
		      --readFilesIn $input1 $input2 \
		      --genomeLoad NoSharedMemory \
		      --outFileNamePrefix $output/starout. \
		      --readFilesCommand zcat \
		      --outSAMmapqUnique 60 \
		      --outSAMattrRGline ID:A01176_584_HHL2VDRX5_1 PL:ILLUMINA PU:HHL2VDRX5_1 LB:NA SM:81thitakf-110524631622-Tumor_Tiss \
		      --quantMode GeneCounts \
		      --twopassMode Basic --twopass1readsN -1 \
	 	      --chimSegmentMin 12 \
		      --chimJunctionOverhangMin 12 \
		      --chimOutJunctionFormat 1 \
		      --alignSJDBoverhangMin 10 \
		      --alignMatesGapMax 100000 \
		      --alignIntronMax 100000 \
		      --alignSJstitchMismatchNmax 5 -1 5 5 \
		      --chimMultimapScoreRange 3 \
		      --chimScoreJunctionNonGTAG -4 \
		      --chimMultimapNmax 20 \
		      --chimNonchimScoreDropMin 10 \
		      --peOverlapNbasesMin 12 \
		      --peOverlapMMp 0.1 \
		      --outTmpDir $temp \
		      --outSAMtype SAM --outStd SAM \
		      > $output/staroutput.sam;
