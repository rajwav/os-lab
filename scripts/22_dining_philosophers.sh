#!/usr/bin/env bash
# Dining Philosophers Problem solution with deadlock prevention (resource ordering)
# Usage: bash 22_dining_philosophers.sh

phil(){ l=$1; r=$((($1+1)%5))
((l>r)) && { t=$l; l=$r; r=$t; }
exec 3>fork$l 4>fork$r
flock 3; flock 4
echo "Philosopher $1 eating (forks $l,$r)"; sleep 1
echo "Philosopher $1 done"; flock -u 4; flock -u 3; }
for i in 0 1 2 3 4; do phil $i & done; wait
