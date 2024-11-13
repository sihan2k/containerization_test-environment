#!/usr/bin/bash


#Define necessary variables
input='/mnt/singularity-test-environment/input/240903_NB501792_0591_AHGMFGAFX7-47anthcof-240904T0700NA/ngs_pipeline_workdir/results/alignments/47anthcof-110530629871-Normal_Blood_noinfo-BCM_v4_TwistUDI_X-240903_NB501792_AHGMFGAFX7-RHGM_LABKA_BCM-noinfo.cram'
output='/mnt/singularity-test-environment/output/align_picard/picardsample1'
human_reference='/mnt/singularity-test-environment/shared/resources/human_ref.fasta'
gatk_sif='/mnt/singularity-test-environment/siffolder/gatk_4.2.6.1.sif'
temp='/mnt/singularity-test-environment/temp/align_picard'
log='/mnt/singularity-test-environment/logs/align_picard/log-file.txt'
touch $log


#Setup output files
#touch /mnt/singularity-test-environment/output/align_picard/output.alignment_summary_metrics;
#touch /mnt/singularity-test-environment/output/align_picard/output.insert_size_metrics;
#touch /mnt/singularity-test-environment/output/align_picard/output.quality_distribution_metrics;
#touch /mnt/singularity-test-environment/output/align_picard/output.quality_by_cycle_metrics;
#touch /mnt/singularity-test-environment/output/align_picard/output.base_distribution_by_cycle_metrics;
#touch /mnt/singularity-test-environment/output/align_picard/output.gc_bias.detail_metrics;
#touch /mnt/singularity-test-environment/output/align_picard/output.gc_bias.summary_metrics;
#touch /mnt/singularity-test-environment/output/align_picard/output.bait_bias_detail_metrics;
#touch /mnt/singularity-test-environment/output/align_picard/output.bait_bias_summary_metrics;
#touch /mnt/singularity-test-environment/output/align_picard/output.pre_adapter_detail_metrics;
#touch /mnt/singularity-test-environment/output/align_picard/output.pre_adapter_summary_metrics;
#touch /mnt/singularity-test-environment/output/align_picard/output.quality_yield_metrics;
#touch /mnt/singularity-test-environment/output/align_picard/output.error_summary_metrics;


#Singularity execution from align_picard shell command
singularity exec --bind /mnt/singularity-test-environment/input/ --bind /mnt/singularity-test-environment/output/align_picard/ --bind /mnt/singularity-test-environment/shared/resources $gatk_sif \
	gatk --java-options "-Xmx15g" CollectMultipleMetrics \
             --INPUT $input \
             --REFERENCE_SEQUENCE $human_reference \
             --PROGRAM null \
             --PROGRAM CollectAlignmentSummaryMetrics \
             --PROGRAM CollectInsertSizeMetrics \
             --PROGRAM QualityScoreDistribution \
             --PROGRAM MeanQualityByCycle \
             --PROGRAM CollectBaseDistributionByCycle \
             --PROGRAM CollectGcBiasMetrics \
             --PROGRAM CollectSequencingArtifactMetrics \
             --PROGRAM CollectQualityYieldMetrics \
             --OUTPUT $output > $log 2>&1
