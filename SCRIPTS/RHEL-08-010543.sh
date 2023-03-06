#!/bin/bash

if ! mount | grep -q ' /tmp '; then
   echo "Missing mount for /tmp!"
   echo "FAIL"
   exit 1
else
   echo "PASS"
   exit 0
fi
