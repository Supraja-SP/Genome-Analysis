#### Creating bam files from the assembly as input for metabat ####

#!/bin/bash -l
#SBATCH -A uppmax2023-2-3
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 6:00:00
#SBATCH -J Metabat_inputfiles
#SBATCH --mail-user supraja.sathya-prakash.7461@student.uu.se
#SBATCH --mail-type=ALL

module load bioinfo-tools
module load bcftools
module load bowtie2
module load samtools
module load python

# Creating shortcuts for the directories
ref_1=/home/supraja/Genome_project/DNA_data/DNA_Megahit/SRR4342133_megahit_outfile/final.contigs.fa
out_dir=/home/supraja/Genome_project/DNA_data/Bowtie2Index/SRR4342133
sample1_dir=/home/supraja/Genome_project/DNA_data/SRR4342133_1.paired.trimmed.fastq.gz
sample2_dir=/home/supraja/Genome_project/DNA_data/SRR4342133_2.paired.trimmed.fastq.gz

# Copy input files to scratch directory
mkdir -p $SNIC_TMP
cp $sample1_dir $sample2_dir $ref_1 $SNIC_TMP/
cd $SNIC_TMP

#Basename change
sample_filename=SRR4342133

#Building Bowtie2Index
bowtie2-build $ref_1 final_contigs_index

# Aligining the reads to the genome
bowtie2 -x final_contigs_index -1 $sample1_dir -2 $sample2_dir -S $sample_filename.sam

# Sorting the alignments
samtools sort $sample_filename.sam -o $sample_filename.bam

# Copying the output files to out_dir
cp $sample_filename.bam $out_dir

# Similarly for SRR4342129 was performed


#### To perform metabat without depth file ####

#!/bin/bash -l
#SBATCH -A uppmax2023-2-3
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 30:00
#SBATCH -J Metabat_binning
#SBATCH --mail-user supraja.sathya-prakash.7461@student.uu.se
#SBATCH --mail-type=ALL

# Loading modules
module load bioinfo-tools MetaBat

# Creating shortcuts for the directories
sample_dir1=/home/supraja/Genome_project/DNA_data/Bowtie2Index/SRR4342129/SRR4342129.bam
sample_dir2=/home/supraja/Genome_project/DNA_data/Bowtie2Index/SRR4342133/SRR4342133.bam
ref_dir1=/home/supraja/Genome_project/DNA_data/DNA_Megahit/SRR4342129_megahit_outfile/final.contigs.fa
ref_dir2=/home/supraja/Genome_project/DNA_data/DNA_Megahit/SRR4342133_megahit_outfile/final.contigs.fa
out_dir1=/home/supraja/Genome_project/DNA_data/MetaBat/bins29
out_dir2=/home/supraja/Genome_project/DNA_data/MetaBat/bins33

# Binning the contigs
metabat2 -i $ref_dir1 -o $out_dir1 -bam $sample_dir1
metabat2 -i $ref_dir2 -o $out_dir2 -bam $sample_dir2


