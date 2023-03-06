#!/bin/bash

# must mount /var/log with the noexec option.

if [ "$ACTION" == "harden" ]; then
   if mount | grep -q ' /var/log'; then
      if ! mount | grep ' /var/log' | grep -q "noexec"; then
         LINE="$(grep '\s/var/log\s' < /etc/fstab)"
         c="$(grep -v '\s/var/log\s'< /etc/fstab)"
         c="$c$(echo; echo "$LINE" | awk '{$4=$4",noexec";print $1 " " $2 " " $3 " " $4 " " $5 " " $6}')"
         echo "$c" > /etc/fstab
      fi
      mount -o remount /var/log
   fi
fi

if mount | grep -q ' /var/log'; then
   if ! mount | grep ' /var/log' | grep -q "noexec"; then
      echo "FAIL"
      exit 1
   else
      echo "PASS"
      exit 0
   fi
else
   echo "PASS"
   exit 0
fi

