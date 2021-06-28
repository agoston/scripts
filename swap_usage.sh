#!/bin/bash
for file in /proc/*/status ; do awk '/^VmSwap:|^Name:|^Pid:/ {printf $2 " " $3 "\t"} END {print ""}' $file; done | sort -k 3 -n -r
