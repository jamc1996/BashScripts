#!/bin/bash

# Script to find the roots of a quadratic equation.

# Input checked
if [ "$#" -lt "3" ]
then
  echo "quadratic.sh: insufficient arguments."
  exit 1
fi

# Two parts of solution calculated separately
determinant=$(echo "$2*$2 - 4*$1*$3" | bc -l)
real=$(echo "($2*-1)/(2*$1)" | bc -l)

# Different solution calculation based on determinant
if [ $(echo "$determinant > 0" | bc) = 1 ]
then
  soln1=$(echo "$real +sqrt ( ($determinant) )" | bc -l)
  soln2=$(echo "$real -sqrt ( ($determinant) )" | bc -l)
  printf "Solutions are %.4f and %.4f\n" $soln1 $soln2
elif [ $(echo "$determinant < 0" | bc) = 1 ];
then
  imag=$(echo "sqrt ( (-1*$determinant) )" | bc -l)
  printf "Solutions are %.4f +/- i*%.4f\n" $real $imag
else
  printf "Solution is %.4f\n" $real
fi
