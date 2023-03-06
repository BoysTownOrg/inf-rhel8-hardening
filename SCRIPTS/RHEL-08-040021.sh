#!/bin/bash

if [ "$ACTION" == "harden" ]; then
   if ! grep  atm /etc/modprobe.d/* | grep -q "blacklist"; then
      echo "blacklist atm" >> /etc/modprobe.d/stigs.conf
   fi
fi

if ! grep  atm /etc/modprobe.d/* | grep -q "blacklist"; then
   echo "FAIL"
   exit 1
else
   echo "PASS"
   exit 0
fi  
