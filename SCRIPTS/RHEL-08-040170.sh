#!/bin/bash

if [ "$ACTION" == "harden" ]; then
   if ! systemctl status ctrl-alt-del.target | grep -q masked; then
      systemctl disable ctrl-alt-del.target
      systemctl mask ctrl-alt-del.target
   fi
fi

if ! systemctl status ctrl-alt-del.target | grep -q masked; then
   echo "FAIL"
   exit 1
else 
   echo "PASS"
   exit 0
fi
