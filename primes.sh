#!/bin/bash

# Program to print all primes numbers between 40000 and 42000

# We loop through odd numbers since evens are not prime.
for ((i=40001; i<42000; i+=2))
do
	flag=0	#flag to signal whether number was divisible.
	searchlim=$(echo "( sqrt( $i ) )/1" | bc -l)
	searchlim=${searchlim%.*}
	for ((j=3; j<"$searchlim" ; j+=1))
	do
		remainder=$(echo "scale=0;$i % $j" | bc -l)
		if [ "$remainder" -eq "0" ]
		then
			let flag=1
			break;
		fi
	done
	#primes printed to terminal.
	if [ "$flag" -eq "0" ]
	then
		echo "$i"
	fi
done
