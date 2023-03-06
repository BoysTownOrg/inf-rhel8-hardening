#!/bin/bash

if [ "$ACTION" == "harden" ]; then
   if ! grep -v '^#' /etc/ssh/sshd_config | grep -iq clientalive; then
      echo "ClientAliveInterval 10" >> /etc/ssh/sshd_config
      echo "ClientAliveCountMax 3" >> /etc/ssh/sshd_config
   fi
fi

if ! grep -v '^#' /etc/ssh/sshd_config | grep -iq clientalive; then
   echo "FAIL"
   exit 1
else
   echo "PASS"
   exit 0
fi
