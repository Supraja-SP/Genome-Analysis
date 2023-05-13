#!/bin/bash
#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 2:00:00
#SBATCH -J BWA_mapping for SRR4342139_37
#SBATCH --mail-user supraja.sathya-prakash.7461@student.uu.se
#SBATCH --mail-type=ALL

bin_dir_29=/home/supraja/Genome_project/DNA_data/MetaBat/bins29
bin_dir_33=/home/supraja/Genome_project/DNA_data/MetaBat/bins33
rna_dir_37=/home/supraja/Genome_project/RNA_data/FastQC/SRR4342137
rna_dir_39=/home/supraja/Genome_project/RNA_data/FastQC/SRR4342139
out_dir1=/home/supraja/Genome_project/RNA_data/RNA_mapping_BWA/RNA_mapped_to_location1
out_dir2=/home/supraja/Genome_project/RNA_data/RNA_mapping_BWA/RNA_mapped_to_location2

module load bioinfo-tools bwa samtools

for x in $bin_dir_29/*.fa;
do
    bin_name=$(basename "$x" .fa)
    bwa index $x
    bwa mem $x $rna_dir_37/SRR4342137.1.T-forward-P.fastq.gz $rna_dir_37/SRR4342137.2.T-reverse-P.fastq.gz | \
    samtools view -u -b - > $out_dir1/$bin_name.bam
done

for x in $bin_dir_33/*.fa;
do
    bin_name=$(basename "$x" .fa)
    bwa index $x
    bwa mem $x $rna_dir_39/SRR4342139.1.T-forward-P.fastq.gz $rna_dir_39/SRR4342139.2.T-reverse-P.fastq.gz | \
    samtools view -u -b - > $out_dir2/$bin_name.bam
done
