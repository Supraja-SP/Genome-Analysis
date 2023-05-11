#### Performing FASTQC on Trimmed DNA Samples for both SRR4342129 and SRR4342133 ###

# FastQC was performed on interactive node
salloc -A uppmax2023-2-8 -M snowy -p core -n 2 -t 40:00 

# Load modules
module load bioinfo-tools
module load FastQC

# Creating DNA directories
mkdir -p /home/supraja/Genome_project/DNA_data

# Copying the raw reads as a link 
ln -s /proj/genomeanalysis2023/Genome_Analysis/3_Thrash_2017/DNA_trimmed/* .

# Navigating to directory
cd /home/supraja/Genome_project/DNA_data

# Performing fastqc
fastqc SRR4342129_1.paired.trimmed.fastq.gz SRR4342129_2.paired.trimmed.fastq.gz
fastqc SRR4342133_1.paired.trimmed.fastq.gz SRR4342133_2.paired.trimmed.fastq.gz

# Creating RNA directories
mkdir -p /home/supraja/Genome_project/RNA_data

# Copying the raw reads as a link 
ln -s /proj/genomeanalysis2023/Genome_Analysis/3_Thrash_2017/RNA_untrimmed

# Navigating to directory
cd /home/supraja/Genome_project/RNA_data

# Performing fastqc
fastqc SRR4342137.1.fastq.gz SRR4342137.2.fastq.gz
fastqc SRR4342139.1.fastq.gz SRR4342139.2.fastq.gz
