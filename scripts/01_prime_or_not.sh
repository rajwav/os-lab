#!/usr/bin/env bash
# Check whether a number is prime or not
# Usage: bash 01_prime_or_not.sh (then enter a number)

read -p "Number: " n; p=1
((n<2)) && p=0
for ((i=2;i*i<=n;i++)); do ((n%i==0)) && p=0; done
((p)) && echo Prime || echo "Not prime"
