#!/usr/bin/env bash
# Multilevel Queue CPU scheduling (Queue 1: System FCFS, Queue 2: User FCFS)
# Usage: bash 18_multilevel_queue.sh

read -p "Processes: " n
for ((i=1;i<=n;i++)); do read -p "P$i queue(1=system 2=user) burst: " q[i] b[i]; done
for k in 1 2; do
for ((i=1;i<=n;i++)); do ((q[i]==k)) && { ((t+=b[i])); echo "Queue $k: P$i finish=$t TAT=$t WT=$((t-b[i]))"; }; done
done
