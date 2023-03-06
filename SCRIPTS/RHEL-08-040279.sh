#!/bin/bash

if [ "$ACTION" == "harden" ]; then
   if ! sysctl net.ipv4.conf.all.accept_redirects | grep -q "= 0"; then
      echo "net.ipv4.conf.all.accept_redirects = 0" >> /etc/sysctl.d/99-stigs.conf
      sysctl --system
   fi
fi

if sysctl net.ipv4.conf.all.accept_redirects | grep -q "= 0"; then
   echo "PASS"
else
   echo "FAIL"
   exit 1
fi
