#!/usr/bin/env bash
# Producer-Consumer Problem using FIFOs as counting semaphores
# Usage: bash 23_producer_consumer.sh

mkfifo e f; exec 3<>e 4<>f
for i in 1 2 3; do echo >&3; done
producer(){ for i in 1 2 3 4 5 6; do read -u3; echo $i >&4; echo "Produced $i"; done; }
consumer(){ for i in 1 2 3 4 5 6; do read -u4 x; echo "Consumed $x"; echo >&3; sleep 1; done; }
producer & consumer & wait; rm e f
