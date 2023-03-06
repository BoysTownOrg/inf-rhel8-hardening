#!/bin/bash

if mount | grep -q ' /var/tmp '; then
   echo "PASS"
   exit 0
else
   echo "FAIL"
   exit 1
fi
