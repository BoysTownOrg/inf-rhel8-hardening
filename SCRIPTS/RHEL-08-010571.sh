#!/bin/bash

# Must prevent files with the setuid and setgid bit set from being executed on the /boot directory.

if [ "$ACTION" == "harden" ]; then
   if [ -d '/boot' ]; then
     result=$(find / -maxdepth 1 -name boot -perm -2000 -o -perm -4000 -type d)
     [ "$result" != "" ] && sudo chmod -s /boot
   fi
fi

if [ -d '/boot' ]; then
     result=$(find / -maxdepth 1 -name boot -perm -2000 -o -perm -4000 -type d)
     if [ "$result" == "" ]; then
        echo PASS
        exit 0
     else
        echo FAIL
        exit 1
     fi
fi
