#!/bin/bash

# -l = led, -w = wireless controller id
sudo xboxdrv -l 2 -w 0 --trigger-as-button --silent &
sleep 2
sudo xboxdrv -l 3 -w 1 --trigger-as-button --silent &
