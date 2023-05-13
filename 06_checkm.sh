#!/bin/bash
#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 1:00:00
#SBATCH -J CheckM29
#SBATCH --mail-user supraja.sathya-prakash.7461@student.uu.se
#SBATCH --mail-type=ALL

#Loading modules
module load bioinfo-tools CheckM/1.0.12

# Running Checkm lineage workflow
checkm lineage_wf --reduced_tree -t 4 -x fa /home/supraja/Genome_project/DNA_data/MetaBat/bins29 /home/supraja/Genome_project/DNA_data/CheckM/CheckM_29_results
