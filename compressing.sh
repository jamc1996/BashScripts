#!/bin/bash

# Script to perform compression with different shell utilites & print report.

# Filename set and old compressed files removed.
filename="${1:-Hamlet.txt}"
rm -f "$filename.zip" "$filename.gz" "$filename.bz2" "$filename.xz"

# Compressions done
zip "$filename.zip" "$filename" 1> /dev/null
gzip < "$filename" > "$filename.gz"
bzip2 -k "$filename"
xz -k "$filename"

# File sizes calculated in human readable and regular forms.
horig_sz=$(ls -lh | grep -e "$filename"$ | awk '{print $5}')
hzip_sz=$(ls -lh | grep -e "$filename".zip$ | awk '{print $5}')
hgz_sz=$(ls -lh | grep -e "$filename".gz$ | awk '{print $5}')
hbz_sz=$(ls -hl | grep -e "$filename".bz2 | awk '{print $5}')
hxz_sz=$(ls -lh | grep -e "$filename".xz | awk '{print $5}')

orig_sz=$(ls -l | grep -e "$filename"$ | awk '{print $5}')
zip_sz=$(ls -l | grep -e "$filename".zip$ | awk '{print $5}')
gz_sz=$(ls -l | grep -e "$filename".gz$ | awk '{print $5}')
bz_sz=$(ls -l | grep -e "$filename".bz2 | awk '{print $5}')
xz_sz=$(ls -l | grep -e "$filename".xz | awk '{print $5}')

# Compression rates calculated
zip_comp_rate=$(echo " ($orig_sz) / ($zip_sz)" | bc -l)
gz_comp_rate=$(echo " ($orig_sz) / ($gz_sz)" | bc -l)
bz_comp_rate=$(echo " ($orig_sz) / ($bz_sz)" | bc -l)
xz_comp_rate=$(echo " ($orig_sz) / ($xz_sz)" | bc -l)


# Report printed.
echo ""
echo "The original file size was $horig_sz"
echo ""

echo "Compression using zip utility:"
echo "Compressed file size = $hzip_sz"
printf "Compression Rate = %.3f\n\n" $zip_comp_rate

echo "Compression using gzip utility:"
echo "Compressed file size = $hgz_sz"
printf "Compression Rate = %.3f\n\n" $gz_comp_rate

echo "Compression using bzip2 utility:"
echo "Compressed file size = $hbz_sz"
printf "Compression Rate = %.3f\n\n" $bz_comp_rate

echo "Compression using xz utility:"
echo "Compressed file size = $hxz_sz"
printf "Compression Rate = %.3f\n\n" $xz_comp_rate






