#!/bin/bash

if [ "$ACTION" == "harden" ]; then
   if ! postconf -n smtpd_client_restrictions | grep -q reject; then
      postconf -e 'smtpd_client_restrictions = permit_mynetworks,reject'
   fi
fi

if ! postconf -n smtpd_client_restrictions | grep -q reject; then
   echo "FAIL"
   exit 1
else
   echo "PASS"
   exit 0
fi
