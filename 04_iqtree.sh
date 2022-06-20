### tree building ###

### for complete chloroplasts
### concat chloroplasts
cat iqtree/samples_all/*complete*.fasta > iqtree/iqtree_complete/assembled_chloroplasts.fasta
cat iqtree/iqtree_complete/assembled_chloroplasts.fasta iqtree/wang_chloroplasts.fasta > iqtree/iqtree_complete/samples.fasta

### allignment
mafft --thread 6 iqtree/iqtree_complete/samples.fasta > iqtree/iqtree_complete/samples_alligned.ali

iqtree -T 6 -s iqtree/iqtree_complete/samples_alligned.ali


### including incomplete chloroplasts
### concat chloroplasts
cat iqtree/samples_all/*complete*.fasta > iqtree/iqtree_with_scaffolds/assembled_chloroplasts.fasta
cat iqtree/samples_all/scaffolds/singletons/*.fasta > iqtree/iqtree_with_scaffolds/scaffolds_assembled.fasta
cat iqtree/iqtree_with_scaffolds/assembled_chloroplasts.fasta iqtree/iqtree_with_scaffolds/scaffolds_assembled.fasta iqtree/wang_chloroplasts.fasta > iqtree/iqtree_with_scaffolds/samples.fasta

### allignment
mafft --thread 6 iqtree/iqtree_with_scaffolds/samples.fasta > iqtree/iqtree_with_scaffolds/samples_alligned.ali


### ML tree
iqtree -T 6 -s iqtree/iqtree_with_scaffolds/samples_alligned.ali
echo 'done'

### including extra samples
### concat chloroplasts
cat iqtree/samples_all/*complete*.fasta > iqtree/iqtree_emily_april/assembled_chloroplasts.fasta
cat iqtree/samples_all/scaffolds/singletons/*.fasta > iqtree/iqtree_emily_april/scaffolds_assembled.fasta
cat iqtree/iqtree_emily_april/assembled_chloroplasts.fasta iqtree/iqtree_emily_april/scaffolds_assembled.fasta iqtree/wang_chloroplasts.fasta  iqtree/iqtree_emily_april/emily_samples.fasta > iqtree/iqtree_emily_april/samples.fasta

### allignment
mafft --thread 8 iqtree/iqtree_emily_april/samples.fasta > iqtree/iqtree_emily_april/samples_alligned.ali

### ML tree
iqtree -T 8 -s iqtree/iqtree_emily_april/samples_alligned.ali
echo 'done'

### only assembled chloroplasts
### concat chloroplasts
cat iqtree/samples_all/*complete*.fasta > iqtree/iqtree_only_assembled/assembled_chloroplasts.fasta
cat iqtree/iqtree_only_assembled/assembled_chloroplasts.fasta iqtree/Liriodendron_tulipifera.fasta > iqtree/iqtree_only_assembled/samples.fasta

### allignment
mafft --thread 8 iqtree/iqtree_only_assembled/samples.fasta > iqtree/iqtree_only_assembled/samples_alligned.ali

### ML tree
iqtree -T 8 -s iqtree/iqtree_only_assembled/samples_alligned.ali
echo 'done'