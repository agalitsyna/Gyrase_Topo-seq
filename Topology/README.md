### DNA topology in E. coli

Pipeline for 3C data processing of _E. coli_ from raw reads to .cool and TADs. 

#### Initial data description

Two versions of genomes are used: 

- ecolW3110MuSGS.fasta from GEO GSE117186
- ecol96.fasta from GenBank (U00096.2 version)

3C data for HpaII restriction enzyme are replicates from GSE107301 (wt, 37C, exponential growth).

#### Processing pipeline

- 00\_download.sh: download and dump of SRA files
- 01\_mapping.sh: mapping with ```bwa mem``` allowing split read alignment
- 02\_parse.sh: parsing of sam files with modified version of pairsamtools
