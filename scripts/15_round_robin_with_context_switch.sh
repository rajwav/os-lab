#!/usr/bin/env bash
# Round Robin CPU scheduling with context switch overhead
# Usage: bash 15_round_robin_with_context_switch.sh

read -p "Processes quantum switch-time: " n q cs
for ((i=1;i<=n;i++)); do read -p "P$i arrival burst: " a[i] b[i]; r[i]=${b[i]}; done
fin(){ ((tat=$2-a[$1], wt=tat-b[$1], T+=tat, W+=wt)); echo "P$1 finish=$2 TAT=$tat WT=$wt"; }
add(){ for ((j=1;j<=n;j++)); do ((a[j]<=t && !s[j])) && { s[j]=1; Q+=($j); }; done; }
t=0; left=n; add
while ((left)); do
((${#Q[@]})) || { ((t++)); add; continue; }
i=${Q[0]}; Q=("${Q[@]:1}")
x=$((r[i]<q?r[i]:q)); ((r[i]-=x))
for ((k=0;k<x;k++)); do ((t++)); add; done
((r[i])) && Q+=($i) || { ((left--)); fin $i $t; }
((left)) && for ((k=0;k<cs;k++)); do ((t++)); add; done
done
awk -v T=$T -v W=$W -v n=$n 'BEGIN{printf "Average TAT=%.2f  Average WT=%.2f\n",T/n,W/n}'
