#!/usr/bin/env bash
# Deadlock Detection Algorithm using Allocation, Request and Available matrices
# Usage: bash 20_deadlock_detection.sh

read -p "Processes resources: " n m
echo Allocation; for ((i=0;i<n;i++)); do read -a r; for ((j=0;j<m;j++)); do A[i*m+j]=${r[j]}; done; done
echo Request; for ((i=0;i<n;i++)); do read -a r; for ((j=0;j<m;j++)); do R[i*m+j]=${r[j]}; done; done
read -p "Available: " -a W
for ((c=0;c<n;c++)); do for ((i=0;i<n;i++)); do
((f[i])) && continue
ok=1; for ((j=0;j<m;j++)); do ((R[i*m+j]>W[j])) && ok=0; done
((ok)) && { for ((j=0;j<m;j++)); do ((W[j]+=A[i*m+j])); done; f[i]=1; } 
done; done
for ((i=0;i<n;i++)); do ((f[i])) || d+="P$i "; done
[ -z "$d" ] && echo "No deadlock" || echo "Deadlocked: $d"
