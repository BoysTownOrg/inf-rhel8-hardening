#!/bin/bash

if [ "$ACTION" == "harden" ]; then
   if ! grep  firewire-core /etc/modprobe.d/* | grep -q "blacklist"; then
      echo "blacklist firewire-core" >> /etc/modprobe.d/stigs.conf
   fi
fi

if ! grep  firewire-core /etc/modprobe.d/* | grep -q "blacklist"; then
   echo "FAIL"
   exit 1
else
   echo "PASS"
   exit 0
fi  
