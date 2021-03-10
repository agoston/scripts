#!/bin/sh
# disable
#rm -f /opt/nocb.dmg
#hdiutil create -megabytes 16 -fs HFS+ /opt/nocb
#hdiutil attach /opt/nocb.dmg -mountpoint /Library/Extensions/CbDefenseSensor.kext
#kextcache -i /
# -> reboot

### a kextcache -i miatt nem latja a kernel a modult, es nem is tolti be.
### ezen a ponton rm -rf /Library/Extensions/CbDefenseSensor.kext, majd touch /Library/Extensions/CbDefenseSensor.kext, majd chflags hogy ugy is maradjon
### kesz!

# csak referencia, nem kell
# to unload + disable a plist in /Library/Launch*:
# launchctl unload -w com.blabla.plist
# to re-enable:
# launchctl load -w com.blabla.plist
