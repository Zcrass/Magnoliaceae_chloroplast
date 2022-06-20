##### trimming #####

mkdir trimmed

while read p; do echo "#######################################"; echo "$p"; echo "#######################################"; trimmomatic PE -threads 6 -phred33 -trimlog trimmed/$p'.log' raw_wgs/renamed/$p'_R1.fastq.gz' raw_wgs/renamed/$p'_R2.fastq.gz' trimmed/$p'_R1_paired.fastq' trimmed/$p'_R1_unpaired.fastq' trimmed/$p'_R2_paired.fastq' trimmed/$p'_R2_unpaired.fastq' ILLUMINACLIP:/mnt/e/server/Trimmomatic-0.39/adapters/TruSeq3-PE-2.fa:2:30:10:1:TRUE SLIDINGWINDOW:5:20 ; done < raw_wgs/renamed/files.txt 



