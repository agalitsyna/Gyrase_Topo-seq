### DNA topology in E. coli

Pipeline for 3C data processing of _E. coli_ from raw reads (.fastq) to interaction heatmaps (.cool) and TADs annotation. 

#### Initial data description

Two versions of genomes are used: 

- ecolW3110MuSGS.fasta from GEO GSE117186 [1]
- ecol96.fasta from GenBank (U00096.2 version)

3C data for HpaII restriction enzyme are replicates from GSE107301 (wt, 37C, exponential growth) [2].

#### Processing pipeline

- 00\_download.sh: download and dump of SRA files
- 01\_mapping.sh: mapping with ```bwa mem``` allowing split read alignment
- 02\_parse.sh: parsing of sam files with modified version of pairsamtools


#### References
[1] [Single-nucleotide-resolution mapping of DNA gyrase cleavage sites across the Escherichia coli genome.](https://doi.org/10.1093/nar/gky1222)  _Dmitry Sutormin et al._ Nucleic Acids Research, gky1222
[2] [Multiscale Structuring of the _E. coli_ Chromosome by Nucleoid-Associated and Condensin Proteins.](https://doi.org/10.1016/j.cell.2017.12.027) _Virginia S. Lioy et al._ Cell, Volume 172, Issue 4, 771-783.e18
