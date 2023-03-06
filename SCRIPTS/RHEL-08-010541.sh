#!/bin/bash

if ! mount | grep -q ' /var/log '; then
   echo "Missing mount for /var/log!"
   echo "FAIL"
   exit 1
else
   echo "PASS"
   exit 0
fi
