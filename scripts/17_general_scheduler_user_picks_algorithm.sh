#!/usr/bin/env bash
# General CPU scheduler allowing user to select scheduling algorithm (FCFS, SJF, SRTN, Priority, RR)
# Usage: bash 17_general_scheduler_user_picks_algorithm.sh

echo "1 FCFS 2 SJF 3 SRTN 4 PRIORITY-P 5 PRIORITY-NP 6 RR"; read -p "Choose: " c
read -p "Processes: " n; ((c==6)) && read -p "Quantum: " q
for ((i=1;i<=n;i++)); do read -p "P$i arrival burst priority: " a[i] b[i] p[i]; r[i]=${b[i]}; done
fin(){ ((tat=$2-a[$1], wt=tat-b[$1], T+=tat, W+=wt)); echo "P$1 finish=$2 TAT=$tat WT=$wt"; }
if ((c<6)); then
for ((t=0,left=n,cur=0;left>0;t++)); do
if ((!cur || c==3 || c==4)); then
cur=0
for ((i=1;i<=n;i++)); do
((r[i]>0 && a[i]<=t)) || continue
case $c in 1) v=${a[i]};; 2) v=${b[i]};; 3) v=${r[i]};; *) v=${p[i]};; esac
((!cur || v<best)) && { cur=$i; best=$v; }
done
fi
((cur)) || continue
((--r[cur]==0)) && { ((left--)); fin $cur $((t+1)); cur=0; }
done
else
add(){ for ((j=1;j<=n;j++)); do ((a[j]<=t && !s[j])) && { s[j]=1; Q+=($j); }; done; }
t=0; left=n; add
while ((left)); do
((${#Q[@]})) || { ((t++)); add; continue; }
i=${Q[0]}; Q=("${Q[@]:1}")
x=$((r[i]<q?r[i]:q)); ((r[i]-=x))
for ((k=0;k<x;k++)); do ((t++)); add; done
((r[i])) && Q+=($i) || { ((left--)); fin $i $t; }
done
fi
awk -v T=$T -v W=$W -v n=$n 'BEGIN{printf "Average TAT=%.2f  Average WT=%.2f\n",T/n,W/n}'
