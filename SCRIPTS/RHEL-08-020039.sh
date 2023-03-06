#!/bin/bash

if [ "$ACTION" == "harden" ]; then
   if ! rpm -q tmux >/dev/null; then
      yum install -y tmux
   fi
fi

if ! rpm -q tmux >/dev/null; then
   echo "FAIL"
   exit 1
else
   echo "PASS"
   exit 0
fi
