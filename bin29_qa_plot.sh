#!/bin/bash -l
#SBATCH -A uppmax2023-2-3
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 6:00:00
#SBATCH -J bin_stat29
#SBATCH --mail-user supraja.sathya-prakash.7461@student.uu.se
#SBATCH --mail-type=ALL

module load bioinfo-tools
module load CheckM/1.0.12

out_folder=/home/supraja/Genome_project/DNA_data/CheckM/CheckM_29_results/
bin_folder=/home/supraja/Genome_project/DNA_data/MetaBat/bins29/
plot_folder=/home/supraja/Genome_project/DNA_data/CheckM/CheckM_29_results/plots/

checkm bin_qa_plot $out_folder -x fa $bin_folder $plot_folder
