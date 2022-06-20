# ### Using PGA
# mkdir PGA
# mkdir PGA/references
# ### download anotated chloroplasts in GenBank format as references

# mkdir PGA/targets
# cp iqtree/samples_all/*.fasta PGA/targets

# ### running PGA
# mkdir PGA/output
# perl /mnt/e/server/PGA/PGA.pl -r PGA/references/ -t PGA/targets/ -o PGA/output


##### NOTE #####
### GeSeq give better results
################

for f in $(ls geSeq/job-results-2021416201320/*GFF3.gff3); do d=$(echo $f | sed 's/geSeq\/job-results-2021416201320\///' | sed 's/GeSeqJob-20210401-171946_//'); cp $f geSeq/${d}; done

for f in $(ls geSeq/job-results-2021416201320/*.jpg); do d=$(echo $f | sed 's/geSeq\/job-results-2021416201320\///' | sed 's/GeSeqJob-20210401-171946_//'); cp $f geSeq/${d}; done


## Converting input file from GFF3 format to VISTA format
for f in $(ls *.gff3); 


# grep -v "^#" M_cubensis_subsp_acunae_MA0587b.complete.graph1.1_GFF3.gff3 | \
#     grep -v "rps12" | \
#     awk '{if ($3 ~ /gene/) {print $7" "$4" "$5" "$3" "$9} else {print $7" "$4" "$5" "$3} }' | \
#     awk '{if ($4 ~ /gene/) {gsub(/\+/, ">", $1); gsub(/\-/, "<", $1); print $0} else {$1=""; print $0} }' | \
#     sed 's/gene=//' | \
#     sed 's/gene/agene/' | \
#     sort -n -k2 | \
#     sed 's/agene/gene/' | \
#     awk '{$1=$1}1' | \
#     sed 's/CDS/exon/' | \
#     sed 's/tRNA/utr/' | \
#     sed 's/rRNA/utr/' > M_cubensis_subsp_acunae_MA0587b.complete.graph1.1_GFF3.gff3.mvista