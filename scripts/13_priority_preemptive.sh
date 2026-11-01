#!/usr/bin/env bash
# Priority CPU scheduling (preemptive, smaller number = higher priority)
# Usage: bash 13_priority_preemptive.sh

read -p "Processes: " n
for ((i=1;i<=n;i++)); do read -p "P$i arrival burst priority: " a[i] b[i] p[i]; r[i]=${b[i]}; done
fin(){ ((tat=$2-a[$1], wt=tat-b[$1], T+=tat, W+=wt)); echo "P$1 finish=$2 TAT=$tat WT=$wt"; }
for ((t=0,left=n;left>0;t++)); do
m=0
for ((i=1;i<=n;i++)); do ((r[i]>0 && a[i]<=t && (!m || p[i]<p[m]))) && m=$i; done
((m)) || continue
((--r[m]==0)) && { ((left--)); fin $m $((t+1)); }
done
awk -v T=$T -v W=$W -v n=$n 'BEGIN{printf "Average TAT=%.2f  Average WT=%.2f\n",T/n,W/n}'
