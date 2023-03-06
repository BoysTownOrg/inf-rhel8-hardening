#!/bin/bash

if [ "$ACTION" == "harden" ]; then
   if ! cat  /etc/pam.d/password-auth | grep -B99 "auth .* pam_unix.so" | grep -q faillock; then
      cat  /etc/pam.d/password-auth | grep -B99 "auth .* pam_unix.so" | grep -v "auth .* pam_unix.so" > /tmp/password-auth
      echo "auth        required      pam_faillock.so preauth silent audit deny=3 even_deny_root fail_interval=600 unlock_time=600" >> /tmp/password-auth
      cat  /etc/pam.d/password-auth | grep -A99 "auth .* pam_unix.so"  >> /tmp/password-auth
      cat /tmp/password-auth | grep -B99 "account .* pam_unix.so" | grep -v "account .* pam_unix.so" > /tmp/password-auth1
      echo "account     required      pam_faillock.so" >> /tmp/password-auth1
      cat /tmp/password-auth | grep -A99 "account .* pam_unix.so" >> /tmp/password-auth1
      cat /tmp/password-auth1 > /etc/pam.d/password-auth
      rm -f /tmp/password-auth /tmp/password-auth1
   fi
fi

if cat  /etc/pam.d/password-auth | grep -B99 "auth .* pam_unix.so" | grep -q faillock; then
   echo "PASS"
   exit 0
else
   echo "FAIL"
   exit 1
fi

