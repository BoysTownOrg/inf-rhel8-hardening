#!/bin/bash

if [ "$ACTION" == "harden" ]; then
   if ! grep -i -q "^banner" /etc/ssh/sshd_config; then
      echo "Banner /etc/issue" >> /etc/ssh/sshd_config
   fi
fi

if ! grep -i -q "^banner" /etc/ssh/sshd_config; then
   echo "FAIL"
   exit 1
else
   echo "PASS"
   exit 0
fi
