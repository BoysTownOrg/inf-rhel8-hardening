#!/bin/bash

if [ "$ACTION" == "harden" ]; then
   if ! grep  sctp /etc/modprobe.d/* | grep -q "blacklist"; then
      echo "blacklist sctp" >> /etc/modprobe.d/stigs.conf
   fi
fi

if ! grep  sctp /etc/modprobe.d/* | grep -q "blacklist"; then
   echo "FAIL"
   exit 1
else
   echo "PASS"
   exit 0
fi  
