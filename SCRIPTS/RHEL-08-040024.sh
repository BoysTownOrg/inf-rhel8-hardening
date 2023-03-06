#!/bin/bash

if [ "$ACTION" == "harden" ]; then
   if ! grep  tipc /etc/modprobe.d/* | grep -q "blacklist"; then
      echo "blacklist tipc" >> /etc/modprobe.d/stigs.conf
   fi
fi

if ! grep  tipc /etc/modprobe.d/* | grep -q "blacklist"; then
   echo "FAIL"
   exit 1
else
   echo "PASS"
   exit 0
fi  
