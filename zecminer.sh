#!/bin/bash
cd "$(dirname $0)"
nice -n -10 screen -T xterm-256color -d -m ~/miner/miner --config ~/miner/miner.cfg
