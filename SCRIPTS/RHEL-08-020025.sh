#!/bin/bash

if [ "$ACTION" == "harden" ]; then
   if ! cat  /etc/pam.d/system-auth | grep -B99 "auth .* pam_unix.so" | grep -q faillock; then
      cat  /etc/pam.d/system-auth | grep -B99 "auth .* pam_unix.so" | grep -v "auth .* pam_unix.so" > /tmp/system-auth
      echo "auth        required      pam_faillock.so preauth silent audit deny=3 even_deny_root fail_interval=600 unlock_time=600" >> /tmp/system-auth
      cat  /etc/pam.d/system-auth | grep -A99 "auth .* pam_unix.so"  >> /tmp/system-auth
      cat /tmp/system-auth | grep -B99 "account .* pam_unix.so" | grep -v "account .* pam_unix.so" > /tmp/system-auth1
      echo "account     required      pam_faillock.so" >> /tmp/system-auth1
      cat /tmp/system-auth | grep -A99 "account .* pam_unix.so" >> /tmp/system-auth1
      cat /tmp/system-auth1 > /etc/pam.d/system-auth
      rm -f /tmp/system-auth /tmp/system-auth1
   fi
fi

if cat  /etc/pam.d/system-auth | grep -B99 "auth .* pam_unix.so" | grep -q faillock; then
   echo "PASS"
   exit 0
else
   echo "FAIL"
   exit 1
fi

