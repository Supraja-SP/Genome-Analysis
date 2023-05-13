#!/bin/bash
#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 6:00:00
#SBATCH -J HTSEQ_29
#SBATCH --mail-user supraja.sathya-prakash.7461@student.uu.se
#SBATCH --mail-type=ALL

# Loading modules
module load bioinfo-tools
module load htseq

prokka_bin29=/home/supraja/Genome_project/DNA_data/Prokka/Prokka29_bins
bam_sorted_dir1=/home/supraja/Genome_project/RNA_data/RNA_mapping_BWA/RNA_mapped_to_location1
out_dir=/home/supraja/Genome_project/DNA_data/HTseq/annotated_bins29

for bin in $bam_sorted_dir1/*.bam
do
        bin_dir_name=$(basename "$bin" _sorted.bam)
        htseq-count -f bam -r pos -t CDS -i ID --stranded=no ${bin} <(sed '/^##FASTA/Q' ${prokka_bin29}/${bin_dir_name}/${bin_dir_name}.gff) > ${out_dir}/${bin_dir_name}_counts.out
done



#!/bin/bash
#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 6:00:00
#SBATCH -J HTSEQ_33
#SBATCH --mail-user supraja.sathya-prakash.7461@student.uu.se
#SBATCH --mail-type=ALL

# Loading modules
module load bioinfo-tools
module load htseq

prokka_bin33=/home/supraja/Genome_project/DNA_data/Prokka/Prokka33_bins
bam_sorted_dir2=/home/supraja/Genome_project/RNA_data/RNA_mapping_BWA/RNA_mapped_to_location2
out_dir=/home/supraja/Genome_project/DNA_data/HTseq/annotated_bins33

for bin in $bam_sorted_dir2/*.bam
do
        bin_dir_name=$(basename "$bin" _sorted.bam)
        htseq-count -f bam -r pos -t CDS -i ID --stranded=no ${bin} <(sed '/^##FASTA/Q' ${prokka_bin33}/${bin_dir_name}/${bin_dir_name}.gff) > ${out_dir}/${bin_dir_name}_counts.out
done
