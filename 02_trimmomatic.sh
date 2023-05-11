#### Trimming RNA data using Trimmomatic module ####

# Using the interactive node
salloc -A uppmax2023-2-8 -M snowy -p core -n 2 -t 1:00:00

# Loading modules
module load bioinfo-tools trimmomatic

# Performing trimming of data
trimmomatic PE SRR4342137.1.fastq.gz SRR4342137.2.fastq.gz SRR4342137.1.T-forward-P.fastq.gz SRR4342137.1.T-forward-uP.fastq.gz SRR4342137.2.T-reverse-P.fastq.gz SRR4342137.2.T-reverse-uP.fastq.gz LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36 ILLUMINACLIP:/sw/apps/bioinfo/trimmomatic/0.39/rackham/adapters/TruSeq3-PE.fa:2:30:10

trimmomatic PE SRR4342139.1.fastq.gz SRR4342139.2.fastq.gz SRR4342139.1.T-forward-P.fastq.gz SRR4342139.1.T-forward-uP.fastq.gz SRR4342139.2.T-reverse-P.fastq.gz SRR4342139.2.T-reverse-uP.fastq.gz LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36 ILLUMINACLIP:/sw/apps/bioinfo/trimmomatic/0.39/rackham/adapters/TruSeq3-PE.fa:2:30:10

# SRR4342137.1.T-forward-P.fastq.gz , 1- Forward seq, T-Trimmed data, P- Paired
# SRR4342137.2.T-reverse-uP.fastq.gz , 2- Reverse seq, T-Trimmed data, uP- unPaired
