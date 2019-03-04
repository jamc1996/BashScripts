#!/bin/bash

# Script to print 6 pseudo random non-repeating numbers between 1 and 45

echo "$(shuf -i 1-45 -n 6)"
