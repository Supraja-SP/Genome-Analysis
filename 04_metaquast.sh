#!/bin/bash -l
#SBATCH -A uppmax2023-2-3
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 6:30:00
#SBATCH -J Metaquest
#SBATCH --mail-user supraja.sathya-prakash.7461@student.uu.se
#SBATCH --mail-type=ALL

# Loading the modules
module load bioinfo-tools
module load quast/5.0.2
module load python

# Running the assembly evaluation on the final contig obtained from megahit

metaquast.py --max-ref-num 0 /home/supraja/Genome_project/DNA_data/DNA_Megahit/SRR4342129_megahit_outfile/final.contigs.fa -o /home/supraja/Genome_project/DNA_data/MetaQuast/meta29

metaquast.py --max-ref-num 0 /home/supraja/Genome_project/DNA_data/DNA_Megahit/SRR4342133_megahit_outfile/final.contigs.fa -o /home/supraja/Genome_project/DNA_data/MetaQuast/meta33
