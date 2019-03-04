#!/bin/bash

# Script to repeatedly run simple_mc and test success rate.

# num_test set and corrects initialized to zero
num_tests="${1:-100}"
corrects=0

# loop through num_tests storing number of successes
for ((i=1; i<$num_tests; i++))
do
	seed=$RANDOM
	correct=$(./simple_mc $seed | grep "y)$" | wc -l )
	corrects=$((corrects +correct))
done

# success rate calculated.
correct_pct=$(echo "100*$corrects/$num_tests" | bc -l)
printf "%.2f%%\n" $correct_pct


