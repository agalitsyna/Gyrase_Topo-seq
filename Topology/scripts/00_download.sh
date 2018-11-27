cd ../data/fastq/
wget ftp://ftp-trace.ncbi.nih.gov/sra/sra-instant/reads/ByRun/sra/SRR/SRR635/SRR6354565/SRR6354565.sra &
wget ftp://ftp-trace.ncbi.nih.gov/sra/sra-instant/reads/ByRun/sra/SRR/SRR700/SRR7001741/SRR7001741.sra &
fastq-dump --split-files SRR*
