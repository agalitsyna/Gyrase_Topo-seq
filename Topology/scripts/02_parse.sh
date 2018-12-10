# Chromosome length count
#python -c "print(len(''.join([x.strip() for x in open('../data/genome/ecolW3110MuSGS.fasta', 'r').readlines()[1:]])))"

# Cuting the genome with HpaII restriction enzyme
# Note that for ecolW3110MuSGS.fasta and HpaII enzyme there was a bug of restriction fragments processing!
#cooler digest -o ../data/genome/ecol96_HpaII.bed ../data/genome/ecol96_chromsizes.txt ../data/genome/ecol96.fasta HpaII
#cooler digest -o ../data/genome/ecolW3110MuSGS_HpaII.bed ../data/genome/ecolW3110MuSGS_chromsizes.txt ../data/genome/ecolW3110MuSGS.fasta HpaII

# Ordinary parsing with pairsamtools (example)
#pairsamtools parse --walks-policy 5unique -c ../data/genome/ecolW3110MuSGS_chromsizes.txt ../data/bam/Sut7.bam | pairsamtools sort --nproc 20 -o ../data/pairsam/Sut7.pairsam

# Parsing with agalitsyna github version of pairsamtools (https://github.com/agalitsyna/pairsamtools)
# reporting ligation junctions

enzyme="HpaII"

for name in Sut7 SRR7001741 SRR6354565
do
	for genome in ecolW3110MuSGS ecol96
	do 
		pairsamtools parse --walks-policy ligation_junctions -c ../data/genome/${genome}_chromsizes.txt --frags ../data/genome/${genome}_${enzyme}.bed --drop-sam --add-columns rfrag,rfrag_dist_up,rfrag_dist_down,rfrag_dist --output-stats ../data/pairsam/${name}_${genome}_lj_stats.txt ../data/bam/${name}_${genome}.bam > ../data/pairsam/${name}_${genome}_lj.pairsam &	
	done
done

wait

for name in Sut7 SRR7001741 SRR6354565
do
	for genome in ecolW3110MuSGS ecol96
	do 
		pairsamtool dedup --output-stats ../data/pairsam/${name}_${genome}_lj_stats.txt ../data/pairsam/${name}_${genome}_lj.pairsam > ../data/pairsam/${name}_${genome}_lj.pairsam.dedup
	done
done
