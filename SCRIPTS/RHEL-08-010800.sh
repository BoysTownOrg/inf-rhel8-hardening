#!/bin/bash

if ! mount | grep -q ' /home '; then
   echo "Missing mount for /home!"
   echo "FAIL"
   exit 1
else
   echo "PASS"
   exit 0
fi
