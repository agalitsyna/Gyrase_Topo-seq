# Cuting the genome with HpaII restriction enzyme
#cooler digest -o ../data/genome/ecol96_HpaII.bed ../data/genome/ecol96_chromsizes.txt ../data/genome/ecol96.fasta HpaII
#cooler digest -o ../data/genome/ecolW3110MuSGS_HpaII.bed ../data/genome/ecolW3110MuSGS_chromsizes.txt ../data/genome/ecolW3110MuSGS.fasta HpaII

# Ordinary parsing with pairsamtools (for example)
#pairsamtools parse --walks-policy 5unique -c ../data/genome/ecolW3110MuSGS_chromsizes.txt ../data/bam/Sut7.bam | pairsamtools sort --nproc 20 -o ../data/pairsam/Sut7.pairsam

# Parsing with agalitsyna github version of pairsamtools (https://github.com/agalitsyna/pairsamtools)
# reporting ligation junctions

pairsamtools parse --walks-policy ligation_junctions -c ../data/genome/ecolW3110MuSGS_chromsizes.txt --frags ../data/genome/ecolW3110MuSGS_HpaII.bed --drop-sam --add-columns rfrag --output-stats ../data/pairsam/Sut7_lj_stats.txt ../data/bam/Sut7_ecolW3110MuSGS.bam > ../data/pairsam/Sut7_ecolW3110MuSGS_lj.pairsam & 
pairsamtools parse --walks-policy ligation_junctions -c ../data/genome/ecolW3110MuSGS_chromsizes.txt --frags ../data/genome/ecolW3110MuSGS_HpaII.bed --drop-sam --add-columns rfrag --output-stats ../data/pairsam/SRR70017417_ecolW3110MuSGS_lj_stats.txt ../data/bam/SRR70017417_ecolW3110MuSGS.bam > ../data/pairsam/SRR70017417_ecolW3110MuSGS_lj.pairsam &
pairsamtools parse --walks-policy ligation_junctions -c ../data/genome/ecolW3110MuSGS_chromsizes.txt --frags ../data/genome/ecolW3110MuSGS_HpaII.bed --drop-sam --add-columns rfrag --output-stats ../data/pairsam/SRR63545657_ecolW3110MuSGS_lj_stats.txt ../data/bam/SRR63545657_ecolW3110MuSGS.bam > ../data/pairsam/SRR63545657_ecolW3110MuSGS_lj.pairsam &

pairsamtools parse --walks-policy ligation_junctions -c ../data/genome/ecol96_chromsizes.txt --frags ../data/genome/ecol96_HpaII.bed --drop-sam --add-columns rfrag --output-stats ../data/pairsam/Sut7_ecol96_lj_stats.txt ../data/bam/Sut7_ecol96.bam > ../data/pairsam/Sut7_ecol96_lj.pairsam &
pairsamtools parse --walks-policy ligation_junctions -c ../data/genome/ecol96_chromsizes.txt --frags ../data/genome/ecol96_HpaII.bed --drop-sam --add-columns rfrag --output-stats ../data/pairsam/SRR70017417_ecol96_lj_stats.txt ../data/bam/SRR70017417_ecol96.bam > ../data/pairsam/SRR70017417_ecol96_lj.pairsam &
pairsamtools parse --walks-policy ligation_junctions -c ../data/genome/ecol96_chromsizes.txt --frags ../data/genome/ecol96_HpaII.bed --drop-sam --add-columns rfrag --output-stats ../data/pairsam/SRR63545657_ecol96_lj_stats.txt ../data/bam/SRR63545657_ecol96.bam > ../data/pairsam/SRR63545657_ecol96_lj.pairsam &
