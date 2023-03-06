#!/bin/bash

if [ "$ACTION" == "harden" ]; then
   if ! grep -q slub_debug /etc/default/grub; then
      sed -i 's/GRUB_CMDLINE_LINUX="\([^"]*\)"/GRUB_CMDLINE_LINUX="\1 slub_debug=P"/' /etc/default/grub
   fi
fi

if ! grep -q slub_debug /etc/default/grub; then
   echo "FAIL"
   exit 1
else
   echo "PASS"
   exit 0
fi
