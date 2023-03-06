#!/bin/bash

if [ "$ACTION" == "harden" ]; then
   if grep -q -i nullok /etc/pam.d/password-auth; then
      sed -i 's/nullok//g' /etc/pam.d/password-auth
   fi
fi

if grep -q -i nullok /etc/pam.d/password-auth; then
   echo "FAIL"
   exit 1
else
   echo "PASS"
   exit 0
fi  
