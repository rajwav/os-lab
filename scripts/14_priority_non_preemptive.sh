#!/usr/bin/env bash
# Priority CPU scheduling (non-preemptive, smaller number = higher priority)
# Usage: bash 14_priority_non_preemptive.sh

read -p "Processes: " n
for ((i=1;i<=n;i++)); do read -p "P$i arrival burst priority: " a[i] b[i] p[i]; done
fin(){ ((tat=$2-a[$1], wt=tat-b[$1], T+=tat, W+=wt)); echo "P$1 finish=$2 TAT=$tat WT=$wt"; }
for ((k=1,t=0;k<=n;k++)); do
m=0
for ((i=1;i<=n;i++)); do ((!d[i] && a[i]<=t && (!m || p[i]<p[m]))) && m=$i; done
((m)) || { ((t++,k--)); continue; }
((t+=b[m], d[m]=1)); fin $m $t
done
awk -v T=$T -v W=$W -v n=$n 'BEGIN{printf "Average TAT=%.2f  Average WT=%.2f\n",T/n,W/n}'
