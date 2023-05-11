#### Performing metagenome assembly on trimmed DNA data ####

# Using interactive node
salloc -A uppmax2023-2-8 -M snowy -p core -n 2 -t 1:00:00

# Loading modules
module load bioinfo-tools
module load megahit

# Assembly of the trimmed sequences
megahit --kmin-1pass --k-list 59,79,99 -1 SRR4342129_1.paired.trimmed.fastq.gz -2 SRR4342129_2.paired.trimmed.fastq.gz -t 4 -o SRR4342129_megahit_outfile

megahit --kmin-1pass --k-list 59,79,99 -1 SRR4342133_1.paired.trimmed.fastq.gz -2 SRR4342133_2.paired.trimmed.fastq.gz -t 4 -o SRR4342133_megahit_outfile
