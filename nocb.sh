#!/bin/bash
hdiutil attach -imagekey diskimage-class=CRawDiskImage -nomount /loop
mount -t msdos /dev/disk2 /Applications/Confer.app/
launchctl attach -k system/com.carbonblack.defense.daemon
