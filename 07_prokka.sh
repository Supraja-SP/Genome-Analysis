#!/bin/bash -l
#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 12:30:00
#SBATCH -J Prokka29
#SBATCH --mail-user supraja.sathya-prakash.7461@student.uu.se
#SBATCH --mail-type=ALL

#Loading modules
module load bioinfo-tools prokka

# Directory containing output of metabat
bin_dir=/home/supraja/Genome_project/DNA_data/MetaBat/bins29

#Looping through each bin to annotate using prokka
for bin_file in $bin_dir/*.fa
do
    bin_sample=$(basename "$bin_file" .fa)
    prokka --prefix $bin_sample /home/supraja/Genome_project/DNA_data/MetaBat/bins29/$bin_sample* --outdir /home/supraja/Genome_project/DNA_data/Prokka/Prokka29/$bin_sample
done
