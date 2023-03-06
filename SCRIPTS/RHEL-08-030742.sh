#!/bin/bash

if [ "$ACTION" == "harden" ]; then
   if ! grep -q -w "cmdport" /etc/chrony.conf; then
      echo "cmdport 0" >> /etc/chrony.conf
   fi
fi

if ! grep -q -w "cmdport" /etc/chrony.conf; then
   echo "FAIL"
   exit 1
else
   echo "PASS"
   exit 0
fi
