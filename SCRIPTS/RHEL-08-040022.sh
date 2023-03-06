#!/bin/bash

if [ "$ACTION" == "harden" ]; then
   if ! grep  can /etc/modprobe.d/* | grep -q "blacklist"; then
      echo "blacklist can" >> /etc/modprobe.d/stigs.conf
   fi
fi

if ! grep  can /etc/modprobe.d/* | grep -q "blacklist"; then
   echo "FAIL"
   exit 1
else
   echo "PASS"
   exit 0
fi  
