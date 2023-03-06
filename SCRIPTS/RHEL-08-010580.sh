#!/bin/bash

if [ "$ACTION" == "harden" ]; then
   MOUNTS=$(mount | grep '^/dev\S* on /\S' | grep --invert-match 'nodev' | cut -f3 -d' ')
   for MOUNT in $MOUNTS; do
      LINE="$(cat /etc/fstab | grep  "\s${MOUNT}\s")"
      c="$(cat /etc/fstab | grep -v "\s${MOUNT}\s")"
      c="$c$(echo; echo $LINE | awk '{$4=$4",nodev";print $1 " " $2 " " $3 " " $4 " " $5 " " $6}')"
      echo "$c" > /etc/fstab
      mount -o remount $MOUNT
   done
fi

if  mount | grep '^/dev\S* on /\S' | grep -q --invert-match 'nodev'; then
   echo "FAIL"
   exit 1
else
   echo "PASS"
   exit 0
fi
