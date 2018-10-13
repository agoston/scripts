#!/bin/bash
#
# for 'nice -10', enter line in /etc/security/limits.conf:
# miner	-	nice	-10
#
# for nvidia-settings to be able to override fan speed & clock, need this line in /etc/X11/xorg.conf, Section "Screen":
# Option         "Coolbits" "28"
#

(
date
cd "$(dirname $0)"

export GPU_FORCE_64BIT_PTR=0
export GPU_MAX_HEAP_SIZE=100
export GPU_USE_SYNC_OBJECTS=1
export GPU_MAX_ALLOC_PERCENT=100
export GPU_SINGLE_ALLOC_PERCENT=100
#nice -n -10 screen -T xterm-256color -d -m bin/ethminer -U --farm-recheck 100 -S eu1.ethermine.org:4444 -FS us1.ethermine.org:4444 -O 54f2e7ef46093261b06d51a8575a38c1c6c6641c.bruin
nice -n -10 screen -T xterm-256color -d -m bin/ethminer -U --farm-recheck 100 -P stratum1+ssl://0x54f2e7ef46093261b06d51a8575a38c1c6c6641c.bruin@eu1.ethermine.org:5555

) &>> ${0%%sh}log
