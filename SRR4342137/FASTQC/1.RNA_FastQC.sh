#### Performing FastQC on untrimmed RNA data ####

####  SRR4342137  ####

# FastQC was performed on interactive node
salloc -A uppmax2023-2-8 -M snowy -p core -n 2 -t 20:00 

# Load modules
module load bioinfo-tools
module load FastQC

# Creating directories
mkdir -p /home/supraja/Genome_project/RNA_data

# Copying the raw reads as a link 
ln -s /proj/genomeanalysis2023/Genome_Analysis/3_Thrash_2017/RNA_untrimmed/* .

# Navigating to directory
cd /home/supraja/Genome_project/RNA_data

# Performing fastqc
fastqc SRR4342137.1.fastq.gz SRR4342137.2.fastq.gz
