for name in SRR6354565 #D18_10876 D18_10877 D18_10878 D18_10879 D18_10880 Sut7 SRR7001741
do
	for genome in ecolW3110MuSGS ecol96
	do 
		cooler csort -c1 2 -c2 4 -p1 3 -p2 5 -o ../data/pairix/${name}_${genome}_lj.pairsam.dedup.blksrt.gz ../data/pairsam/${name}_${genome}_lj.pairsam.dedup ../data/genome/${genome}_chromsizes.txt; cooler cload pairix -p 4 ../data/genome/${genome}_chromsizes.txt:1000 ../data/pairix/${name}_${genome}_lj.pairsam.dedup.blksrt.gz ../data/pairsam/${name}_${genome}_lj_nofilt.cool & 
	done
done
wait
