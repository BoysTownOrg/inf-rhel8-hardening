#!/bin/bash

if [ "$ACTION" == "harden" ]; then
   if ! grep -i -q fail_delay /etc/login.defs; then
      echo "FAIL_DELAY 4" >> /etc/login.defs
   fi
fi

if ! grep -i -q fail_delay /etc/login.defs; then
   echo "FAIL"
   exit 1
else
   echo "PASS"
   exit 0
fi
