#!/usr/bin/env bash
# Find the largest and smallest number in an array
# Usage: bash 03_largest_and_smallest_number.sh (then enter space-separated numbers)

read -p "Numbers: " -a a
s=($(printf "%s\n" "${a[@]}" | sort -n))
echo "Smallest: ${s[0]}  Largest: ${s[-1]}"
