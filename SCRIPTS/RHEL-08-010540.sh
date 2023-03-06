#!/bin/bash

if ! mount | grep -q ' /var '; then
   echo "Missing mount for /var!"
   echo "FAIL"
   exit 1
else
   echo "PASS"
   exit 0
fi
