#!/bin/bash

if [ "$ACTION" == "harden" ]; then
   if mount | grep -q ' /boot/efi '; then
      if ! mount | grep ' /boot/efi ' | grep -q "nosuid"; then
         LINE="$(cat /etc/fstab | grep  '\s/boot/efi\s')"
         c="$(cat /etc/fstab | grep -v '\s/boot/efi\s')"
         c="$c$(echo; echo $LINE | awk '{$4=$4",nosuid";print $1 " " $2 " " $3 " " $4 " " $5 " " $6}')"
         echo "$c" > /etc/fstab
      fi
      mount -o remount /boot/efi
   fi
fi

if mount | grep -q ' /boot/efi '; then
   if ! mount | grep ' /boot/efi ' | grep -q "nosuid"; then
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
