for name in D18_10876 D18_10877 D18_10878 D18_10879 D18_10880 Sut7 SRR7001741 SRR6354565
do
	for genome in ecolW3110MuSGS ecol96
	do
	  cooler zoomify -p 20 -r 1000,2000,3000,5000,10000,15000,20000,30000,50000,100000 -o ../data/mcool/${name}_${genome}_lj_nofilt.mcool ../data/pairsam/${name}_${genome}_lj_nofilt.cool
		for res in 1000 2000 3000 5000 10000 15000 20000 30000 50000 100000
		do
      cooler balance -p 20 --ignore-diags 2 ../data/mcool/${name}_${genome}_lj_nofilt.mcool::/resolutions/$res
			cooltools compute-expected -p 20 ../data/mcool/${name}_${genome}_lj_nofilt.mcool::/resolutions/${res} > ../data/profiles/${name}_${genome}_lj_nofilt.${res}.expected
			for window_size in 5000 10000 20000
			do
				cooltools diamond-insulation --ignore-diags 2 ../data/mcool/${name}_${genome}_lj_nofilt.mcool::/resolutions/${res} $window_size > ../data/profiles/${name}_${genome}_lj_nofilt.${res}.is${window_size}.tsv
			done
		done
	done
done
wait

