#!/bin/bash -e
#SBATCH -p nbi-medium
#SBATCH -t 0-48:00 # time (D-HH:MM)
#SBATCH --mail-type=END,FAIL # notifications for job done & fail
#SBATCH --mail-user=Martin.Vickers@JIC.ac.uk # send-to address
#SBATCH --mem=16000
#SBATCH -c 8

source bowtie2-2.3.4.1
source samtools-1.7

#HGXF014A_S1_L001_R1_001_val_1.fq.gz  HGXF014A_S1_L002_R1_001_val_1.fq.gz  HGXF014A_S1_L003_R1_001_val_1.fq.gz  HGXF014A_S1_L004_R1_001_val_1.fq.gz
#HGXF014A_S1_L001_R2_001_val_2.fq.gz  HGXF014A_S1_L002_R2_001_val_2.fq.gz  HGXF014A_S1_L003_R2_001_val_2.fq.gz  HGXF014A_S1_L004_R2_001_val_2.fq.gz


srun bowtie2 -p 8 -x TAIR10 SRR6989572_1_trimmed.fq.gz -S MicroPlex_v2_Col_0_leaf_anti-H3K9me2-ChIPed-DNA.sam
srun samtools view -bS MicroPlex_v2_Col_0_leaf_anti-H3K9me2-ChIPed-DNA.sam > MicroPlex_v2_Col_0_leaf_anti-H3K9me2-ChIPed-DNA.bam
srun samtools sort MicroPlex_v2_Col_0_leaf_anti-H3K9me2-ChIPed-DNA.bam -o MicroPlex_v2_Col_0_leaf_anti-H3K9me2-ChIPed-DNA_sorted.bam
srun mv MicroPlex_v2_Col_0_leaf_anti-H3K9me2-ChIPed-DNA_sorted.bam MicroPlex_v2_Col_0_leaf_anti-H3K9me2-ChIPed-DNA.bam
srun samtools index MicroPlex_v2_Col_0_leaf_anti-H3K9me2-ChIPed-DNA.bam
