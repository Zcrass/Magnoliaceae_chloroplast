### chloroplast assembly ###
### raw data
while read f; do get_organelle_from_reads.py  --max-reads 3E7 -1 raw_wgs/renamed/$f'_R1.fastq.gz' -2 raw_wgs/renamed/$f'_R2.fastq.gz' -o getOrganelle/$f -s targets/*_complete.fasta -R 25 -k 21,45,65,85,105 -F embplant_pt -t 8 ; echo '###############################################################'; echo sample $f finished; echo '###############################################################'; done < raw_wgs/renamed/files.txt

### trimmed data with unpaired reads
time while read f; do time get_organelle_from_reads.py --max-reads 3E7 -1 trimmed/$f'_R1_paired.fastq.gz' -2 trimmed/$f'_R2_paired.fastq.gz' -u trimmed/$f'_R1_unpaired.fastq.gz,'trimmed/$f'_R2_unpaired.fastq.gz' -o getOrganelle/$f -s targets/M_dealbata_complete.fasta -R 25 -k 21,45,65,85,105 -F embplant_pt -t 8 ; echo '###############################################################'; echo sample $f finished; echo '###############################################################'; done < files_01.txt

### trimmed data
while read f; do get_organelle_from_reads.py --max-reads 3E7 -1 trimmed/$f'_R1_paired.fastq' -2 trimmed/$f'_R2_paired.fastq.gz' -o getOrganelle/$f -s targets/*_complete.fasta -R 25 -k 21,45,65,85,105 -F embplant_pt -t 8 ; echo '###############################################################'; echo sample $f finished; echo '###############################################################'; done < raw_wgs/renamed/files.txt

### copy files from subfolders
# for f in $(find getOrganelle -type f -name embplant\*.fasta); do d=$( echo $f | sed 's/getOrganelle\///' | sed 's/\/embplant_pt//' | sed 's/.path_sequence//'); cp "$f" iqtree/samples_all/"$d"; done

### rename fasta header
cd chloroplast/samples_all
mkdir outdir
for f in *.fasta; do  awk '/^>/ {gsub(/.fa(sta)?$/,"",FILENAME);printf(">%s\n",FILENAME);next;} {print}' $f > outdir/${f}; done
mv outdir/*fasta .
cd ../..




