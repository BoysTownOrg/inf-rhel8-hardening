#!/bin/bash

if [ "$ACTION" == "harden" ]; then
   if grep -iq "^GSSAPIAuthentication yes" /etc/ssh/sshd_config; then
      sed -i 's/GSSAPIAuthentication yes/GSSAPIAuthentication no/' /etc/ssh/sshd_config
   fi
fi

if grep -iq "^GSSAPIAuthentication yes" /etc/ssh/sshd_config; then
   echo "FAIL"
   exit 1
else
   echo "PASS"
   exit 0
fi
