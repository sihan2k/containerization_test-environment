#!/usr/bin/bash


#Execute bbduk for trimming fastqs

bash /mnt/singularity-test-environment/bash_scripts/align_bbduk_pe.sh &&

#Execute remaining rules dependant on the fastqs

bash /mnt/singularity-test-environment/bash_scripts/align_star.sh &&

bash /mnt/singularity-test-environment/bash_scripts/align_bwa_mem.sh &&

bash /mnt/singularity-test-environment/bash_scripts/hla_t1k_rna.sh
