#!/bin/bash -e
#SBATCH -p jic-medium
#SBATCH -t 0-48:00 # time (D-HH:MM)
#SBATCH --mail-type=END,FAIL # #notifications for job done & fail
#SBATCH --mail-user=Toby.Buttress@JIC.ac.uk # send-to address
#SBATCH --mem=16000
#SBATCH -c 8

source bowtie2-2.3.4.1
source samtools-1.7

#SRR6989580_1_trimmed.fq.gz

srun bowtie2 -p 8 -x TAIR10 -U SRR6989580_1_trimmed.fq.gz -S Col_0_seedling580_anti-H2Bub-ChIP-DNA.sam
srun samtools view -bS Col_0_seedling580_anti-H2Bub-ChIP-DNA.sam > Col_0_seedling580_anti-H2Bub-ChIP-DNA.bam
srun samtools sort Col_0_seedling580_anti-H2Bub-ChIP-DNA.bam -o Col_0_seedling580_anti-H2Bub-ChIP-DNA_sorted.bam
srun mv Col_0_seedling580_anti-H2Bub-ChIP-DNA_sorted.bam Col_0_seedling580_anti-H2Bub-ChIP-DNA.bam
srun samtools index Col_0_seedling580_anti-H2Bub-ChIP-DNA.bam
