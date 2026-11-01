#!/usr/bin/env bash
# Banker's Algorithm for Deadlock Avoidance (Safety Algorithm)
# Usage: bash 19_banker_s_algorithm_avoidance_safety_chec.sh

read -p "Processes resources: " n m
echo Allocation; for ((i=0;i<n;i++)); do read -a r; for ((j=0;j<m;j++)); do A[i*m+j]=${r[j]}; done; done
echo Max; for ((i=0;i<n;i++)); do read -a r; for ((j=0;j<m;j++)); do M[i*m+j]=${r[j]}; done; done
read -p "Available: " -a W
for ((c=0;c<n;c++)); do for ((i=0;i<n;i++)); do
((f[i])) && continue
ok=1; for ((j=0;j<m;j++)); do ((M[i*m+j]-A[i*m+j]>W[j])) && ok=0; done
((ok)) && { for ((j=0;j<m;j++)); do ((W[j]+=A[i*m+j])); done; f[i]=1; s+="P$i "; }
done; done
[ $(wc -w <<< "$s") = $n ] && echo "SAFE: $s" || echo "UNSAFE: deadlock possible"
