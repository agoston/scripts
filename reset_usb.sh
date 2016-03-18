#!/bin/bash

cd /sys/bus/pci/drivers/ehci-pci
find -type l -printf '%P\n' | while read i; do
	echo "$i" > unbind
	sleep .5
	echo "$i" > bind
done
