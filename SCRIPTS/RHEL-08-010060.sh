#!/bin/bash

ISSUE='You are connecting to a Boys Town information system. The use of this information system, and any devices connected to it, may be monitored, recorded, and subject to audit. Access to this system and the Boys Town Network is limited to Boys Town-authorized activity. Any attempt at or unauthorized access, use, or modification is prohibited and subject to criminal and civil penalties. Evidence of criminal activity may be provided to law enforcement. Use of this information system indicates awareness of and consent to these terms and conditions of use, including consent to monitoring and recording.'

if [ "$ACTION" == "harden" ]; then
   if ! grep -q "Boys Town" /etc/issue; then
      echo "$ISSUE" > /etc/issue
   fi
fi

if ! grep -q "Boys Town" /etc/issue; then
   echo "FAIL"
   exit 1
else
   echo "PASS"
   exit 0
fi
