#!/bin/bash

if [ "$ACTION" == "harden" ]; then
   if grep -q "^games:" /etc/passwd; then
      userdel -r games
   fi
fi

if grep -q "^games:" /etc/passwd; then
   echo "FAIL"
   exit 1
else
   echo "PASS"
   exit 0
fi
