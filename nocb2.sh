#!/bin/sh
# disable
#rm -f /opt/nocb.dmg
#hdiutil create -megabytes 16 -fs HFS+ /opt/nocb
#hdiutil attach /opt/nocb.dmg -mountpoint /System/Library/Extensions/CbDefenseSensor.kext
#kextcache -i /

# keep disabled
hdiutil attach /opt/nocb.dmg -mountpoint /System/Library/Extensions/CbDefenseSensor.kext


# to unload + disable a plist in /Library/Launch*:
# launchctl unload -w com.blabla.plist
# to re-enable:
# launchctl load -w com.blabla.plist
