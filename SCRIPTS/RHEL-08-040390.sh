#!/bin/bash

if  [ "$ACTION" == "harden" ]; then
   if rpm -q tuned >/dev/null; then
      yum erase tuned
   fi
fi

if rpm -q tuned >/dev/null; then
   echo "FAIL"
   exit 1
else
   echo "PASS"
   exit 0
fi
