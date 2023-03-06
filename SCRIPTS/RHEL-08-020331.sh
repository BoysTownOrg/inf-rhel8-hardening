#!/bin/bash

if [ "$ACTION" == "harden" ]; then
   if grep -q -i nullok /etc/pam.d/system-auth; then
      sed -i 's/nullok//g' /etc/pam.d/system-auth
   fi
fi

if grep -q -i nullok /etc/pam.d/system-auth; then
   echo "FAIL"
   exit 1
else
   echo "PASS"
   exit 0
fi  
