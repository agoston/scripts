#!/bin/sh
# disable
#rm -f /opt/nocb.dmg
#hdiutil create -megabytes 16 -fs HFS+ /opt/nocb
#hdiutil attach /opt/nocb.dmg -mountpoint /System/Library/Extensions/CbDefenseSensor.kext
#kextcache -i /

# keep disabled
hdiutil attach /opt/nocb.dmg -mountpoint /System/Library/Extensions/CbDefenseSensor.kext
