#!/bin/bash
#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 6:00:00
#SBATCH -J phylophan
#SBATCH --mail-user supraja.sathya-prakash.7461@student.uu.se
#SBATCH --mail-type=ALL

# Loading modules
module load conda
source conda_init.sh

# Setting up a conda environment to use phylophlan

mkdir ~/Genome_project/DNA_data/Phylophan/envs
conda create -n "phylophlan" -c bioconda phylophlan=3.0

mkdir ~/Genome_project/DNA_data/Phylophan/envs/configs
conda activate phylophlan

phylophlan_write_default_configs.sh ~/Genome_project/DNA_data/Phylophan/envs/configs
conda deactivate

source ~/.bashrc

# Loading modules
module load conda
export CONDA_ENVS_PATH=~/Genome_project/DNA_data/Phylophan/envs
source activate phylophlan

# Create variables
outdir=~/Genome_project/DNA_data/Phylophan
configs=~/Genome_project/DNA_data/Phylophan/envs/configs
annotation=~/Genome_project/DNA_data/Prokka/Prokka29_bins

# Create directories
mkdir -p $outdir/input/metagenome

# Symbolic links input data files
for bin in $annotation/*;
do
  ln -sf ${bin}/*.faa $outdir/input/metagenome/
done

cd $outdir

phylophlan -i input/metagenome -d phylophlan --diversity high -f $configs/supermatrix_aa.cfg
