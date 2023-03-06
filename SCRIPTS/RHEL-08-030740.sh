#!/bin/bash

if grep server /etc/chrony.conf  | grep -v maxpoll; then
   echo "FAIL"
   exit 1
else
   echo "PASS"
   exit 0
fi
