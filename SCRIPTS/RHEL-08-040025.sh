#!/bin/bash

if [ "$ACTION" == "harden" ]; then
   if ! grep  cramfs /etc/modprobe.d/* | grep -q "blacklist"; then
      echo "blacklist cramfs" >> /etc/modprobe.d/stigs.conf
   fi
fi

if ! grep  cramfs /etc/modprobe.d/* | grep -q "blacklist"; then
   echo "FAIL"
   exit 1
else
   echo "PASS"
   exit 0
fi  
