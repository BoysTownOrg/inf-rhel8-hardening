#!/bin/bash

if [ "$ACTION" == "harden" ]; then
   if ! grep -i -q localpkg_gpgcheck /etc/dnf/dnf.conf; then
      echo "localpkg_gpgcheck=True" >> /etc/dnf/dnf.conf
   fi
fi

if ! grep -i -q localpkg_gpgcheck /etc/dnf/dnf.conf; then
   echo "FAIL"
   exit 1
else
   echo "PASS"
   exit 0
fi
