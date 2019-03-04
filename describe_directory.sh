#!/bin/bash

# Script to break down the contents of a directory into directories, bash filesand others. 

# Directory set
directory="${1:-.}"

# Counts calculated.
dir_count=$(ls -al "$directory" | grep -e ^d | grep -v " \.\.$" | grep -v " \.$" | wc -l)
bash_count=$(ls -al "$directory" | grep -e ^- | grep -e \.sh$ | wc -l)
total_count=$(ls -al "$directory" | grep -v "^total" |  grep -v " \.$" | grep -v " \.\.$" | wc -l)
other_count=$(( $total_count - $bash_count - $dir_count))

# Results printed
echo "The number of directories inside is $dir_count."
echo "The number of bash files inside is $bash_count."
echo "The number of other files is $other_count."

