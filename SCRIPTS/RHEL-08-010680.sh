#!/bin/bash

if [ "$(grep nameserver /etc/resolv.conf | wc -l)" -lt 2 ]; then
   echo "/etc/resolv.conf is not properly configured!"
   echo "FAIL"
   exit 1
else
   echo "PASS"
fi
