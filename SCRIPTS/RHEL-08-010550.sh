#!/bin/bash

if [ "$ACTION" == "harden" ]; then
   if ! grep -i '^PermitRootLogin' /etc/ssh/sshd_config | grep -q no; then
      c="$(cat /etc/ssh/sshd_config | grep -v "^PermitRootLogin")$(echo "";echo "PermitRootLogin no")"
      echo "$c" > /etc/ssh/sshd_config
   fi
fi

if ! grep -i '^PermitRootLogin' /etc/ssh/sshd_config | grep -q no; then
   echo "FAIL"
   exit 1
else
   echo "PASS"
   exit 0
fi
