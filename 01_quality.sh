##### Quality check #####
### from chloroplast base folder

### run fastQC and multiQC
mkdir raw_wgs/renamed/out_fastQC
fastqc raw_wgs/renamed/*.fastq.gz --outdir=raw_wgs/renamed/out_fastQC --threads=6

mkdir raw_wgs/renamed/out_fastQC/multiQC
multiqc raw_wgs/renamed/out_fastQC --outdir raw_wgs/renamed/out_fastQC/multiqc


