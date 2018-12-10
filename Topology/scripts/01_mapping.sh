
# Genomes indexing
#bwa index ../data/genome/ecolW3110MuSGS.fasta
#bwa index ../data/genome/ecol96.fasta

# Mapping the data to W3110MuSGS version
bwa mem -t 4 -v 3 -SP ../data/genome/ecolW3110MuSGS.fasta ../data/fastq/Sut7_S486_R1_001.fastq.gz ../data/fastq/Sut7_S486_R2_001.fastq.gz | samtools view -bS > ../data/bam/Sut7_ecolW3110MuSGS.bam
bwa mem -t 4 -v 3 -SP ../data/genome/ecolW3110MuSGS.fasta ../data/fastq/SRR6354565_1.fastq.gz ../data/fastq/SRR6354565_2.fastq.gz | samtools view -bS > ../data/bam/SRR6354565_ecolW3110MuSGS.bam &
bwa mem -t 4 -v 3 -SP ../data/genome/ecolW3110MuSGS.fasta ../data/fastq/SRR7001741_1.fastq.gz ../data/fastq/SRR7001741_2.fastq.gz | samtools view -bS > ../data/bam/SRR7001741_ecolW3110MuSGS.bam &

# Mapping to ecoli96 genome (short name for ecol_U00096.2.fasta obtained from public database)
bwa mem -t 4 -v 3 -SP ../data/genome/ecol96.fasta ../data/fastq/Sut7_S486_R1_001.fastq.gz ../data/fastq/Sut7_S486_R2_001.fastq.gz | samtools view -bS > ../data/bam/Sut7_ecol96.bam &
bwa mem -t 4 -v 3 -SP ../data/genome/ecol96.fasta ../data/fastq/SRR6354565_1.fastq.gz ../data/fastq/SRR6354565_2.fastq.gz | samtools view -bS > ../data/bam/SRR6354565_ecol96.bam &
bwa mem -t 4 -v 3 -SP ../data/genome/ecol96.fasta ../data/fastq/SRR7001741_1.fastq.gz ../data/fastq/SRR7001741_2.fastq.gz | samtools view -bS > ../data/bam/SRR7001741_ecol96.bam &

wait
