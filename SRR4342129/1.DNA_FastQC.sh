#### Performing FASTQC on Trimmed DNA Samples for both SRR4342129 and SRR4342133 ###

####  SRR4342129  ####

# FastQC was performed on interactive node
salloc -A uppmax2023-2-8 -M snowy -p core -n 2 -t 20:00 

# Load modules
module load bioinfo-tools
module load FastQC

# Creating directories
mkdir -p /home/supraja/Genome_project/DNA_data

# Copying the raw reads as a link 
ln -s /proj/genomeanalysis2023/Genome_Analysis/3_Thrash_2017/DNA_trimmed/* .

# Navigating to directory
cd /home/supraja/Genome_project/DNA_data

# Performing fastqc
fastqc SRR4342129_1.paired.trimmed.fastq.gz SRR4342129_2.paired.trimmed.fastq.gz
