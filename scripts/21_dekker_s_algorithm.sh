#!/usr/bin/env bash
# Dekker's Algorithm for Mutual Exclusion between two processes
# Usage: bash 21_dekker_s_algorithm.sh

for f in turn f0 f1; do echo 0 > $f; done
g(){ tail -n1 $1; }
p(){ me=$1; o=$((1-me)); echo 1 >> f$me
while [ "$(g f$o)" = 1 ]; do
if [ "$(g turn)" != $me ]; then echo 0 >> f$me
while [ "$(g turn)" != $me ]; do :; done; echo 1 >> f$me; fi
done
echo "P$me IN critical section"; sleep 1; echo "P$me OUT of critical section"
echo $o >> turn; echo 0 >> f$me; }
p 0 & p 1 & wait
