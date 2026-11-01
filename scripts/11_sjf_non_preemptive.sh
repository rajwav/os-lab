#!/usr/bin/env bash
# Shortest Job First (SJF) non-preemptive CPU scheduling algorithm
# Usage: bash 11_sjf_non_preemptive.sh

read -p "Processes: " n
for ((i=1;i<=n;i++)); do read -p "P$i arrival burst: " a[i] b[i]; done
fin(){ ((tat=$2-a[$1], wt=tat-b[$1], T+=tat, W+=wt)); echo "P$1 finish=$2 TAT=$tat WT=$wt"; }
for ((k=1,t=0;k<=n;k++)); do
m=0
for ((i=1;i<=n;i++)); do ((!d[i] && a[i]<=t && (!m || b[i]<b[m]))) && m=$i; done
((m)) || { ((t++,k--)); continue; }
((t+=b[m], d[m]=1)); fin $m $t
done
awk -v T=$T -v W=$W -v n=$n 'BEGIN{printf "Average TAT=%.2f  Average WT=%.2f\n",T/n,W/n}'
