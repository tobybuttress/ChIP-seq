#!/bin/bash -e
#SBATCH -p jic-medium
#SBATCH -t 0-48:00 # time (D-HH:MM)
#SBATCH --mail-type=END,FAIL # notifications for job done & fail
#SBATCH --mail-user=Toby.Buttress@JIC.ac.uk # send-to address
#SBATCH --array=0-3
#SBATCH --mem=8000
#SBATCH -c 4

#source cutadapt-1.9.1
#source fastqc-0.11.3

source trim_galore-0.4.2


ARRAY=(SRR6989572_1.fastq.gz  SRR6989573_1.fastq.gz  SRR6989580_1.fastq.gz  SRR6989581_1.fastq.gz)

srun trim_galore ${ARRAY[$SLURM_ARRAY_TASK_ID]}
