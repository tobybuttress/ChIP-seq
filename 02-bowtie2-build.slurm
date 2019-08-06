#!/bin/bash -e
#SBATCH -p jic-short
#SBATCH --mail-type=END,FAIL # notifications for job done & fail
#SBATCH --mail-user=Toby.Buttress@JIC.ac.uk # send-to address
#SBATCH --mem=8000

source bowtie2-2.3.4.1

srun bowtie2-build TAIR10_reference.fa TAIR10
