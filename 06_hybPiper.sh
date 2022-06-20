while read f; do echo Running sample $f; gunzip -c /mnt/e/Phylogenomics/trimmed/$f'_R1_paired.fastq.gz' > /mnt/e/Phylogenomics/trimmed/$f'_R1_paired.fastq';gunzip -c /mnt/e/Phylogenomics/trimmed/$f'_R2_paired.fastq.gz' > /mnt/e/Phylogenomics/trimmed/$f'_R2_paired.fastq'; time /mnt/e/Phylogenomics/hybPiper_orig/reads_first.py -b /mnt/e/Phylogenomics/hybPiper_orig/targets/RG_8002_reensambled.fasta -r /mnt/e/Phylogenomics/trimmed/$f'_R'{1,2}'_paired.fastq' --prefix $f --bwa; echo 'running cleanup...' ;/mnt/e/Phylogenomics/hybPiper_orig/cleanup.py $f; rm /mnt/e/Phylogenomics/trimmed/$f'_R1_paired.fastq'; rm /mnt/e/Phylogenomics/trimmed/$f'_R2_paired.fastq'; echo sample $f finished; echo "##################################################"; echo "##################################################"; done < /mnt/e/Phylogenomics/filelist_b.txt

/mnt/e/Phylogenomics/hybPiper_orig/retrieve_sequences.py /mnt/e/Phylogenomics/hybPiper_orig/targets/RG_8002_reensambled.fasta . dna 

echo '########## retrieve_sequences intron... ##########'
while read f; do python /mnt/e/Phylogenomics/hybPiper_orig/intronerate.py --prefix $f; done < /mnt/e/Phylogenomics/filelist.txt
/mnt/e/Phylogenomics/hybPiper_orig/retrieve_sequences.py /mnt/e/Phylogenomics/hybPiper_orig/targets/RG_8002_reensambled.fasta . intron

echo '########## retrieve_sequences supercontig... ##########'
/mnt/e/Phylogenomics/hybPiper_orig/retrieve_sequences.py /mnt/e/Phylogenomics/hybPiper_orig/targets/RG_8002_reensambled.fasta . supercontig

echo '########## statistics... ##########'
python /mnt/e/Phylogenomics/hybPiper_orig/get_seq_lengths.py /mnt/e/Phylogenomics/hybPiper_orig/targets/RG_8002_reensambled.fasta /mnt/e/Phylogenomics/filelist.txt dna >  /mnt/e/Phylogenomics/nuclear/gene_lengths_capture_17052022.txt
python /mnt/e/Phylogenomics/hybPiper_orig/hybpiper_stats.py /mnt/e/Phylogenomics/nuclear/gene_lengths_capture_17052022.txt /mnt/e/Phylogenomics/filelist.txt > /mnt/e/Phylogenomics/nuclear/gene_stats_capture_17052022.txt


# while read f; do echo running $f; mafft --thread 7 supercontig/$f'_supercontig.fasta' > supercontig/$f'.ali'; done < genes.txt
# while read f; do echo running $f; iqtree -T 7 -s supercontig/$f'.ali' ; done < genes.txt
# while read f; do sed -i 's/-'$f'//g' trees.treefile; done < genes.txt