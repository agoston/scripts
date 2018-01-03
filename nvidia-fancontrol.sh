#!/bin/bash
# Enable persistence mode
sudo nvidia-smi -i 0 -pm 1

# Increase our Power Limit
sudo nvidia-smi -i 0 -pl 170

#nvidia-settings -a '[gpu:0]/GPUFanControlState=1' -a '[fan:0]/GPUTargetFanSpeed=82' -a '[gpu:0]/GPUMemoryTransferRateOffset[3]=500' -a '[gpu:0]/GPUGraphicsClockOffset[3]=120'
nvidia-settings -a '[gpu:0]/GPUFanControlState=1' -a '[fan:0]/GPUTargetFanSpeed=90' -a '[gpu:0]/GPUMemoryTransferRateOffset[3]=900' -a '[gpu:0]/GPUGraphicsClockOffset[3]=0'
