#!/bin/bash

if [ "$ACTION" == "harden" ]; then
   if ! sysctl net.core.bpf_jit_harden | grep -q "= 2"; then
      echo "net.core.bpf_jit_harden = 2" >> /etc/sysctl.d/99-stigs.conf
      sysctl --system
   fi
fi

if sysctl net.core.bpf_jit_harden | grep -q "= 2"; then
   echo "PASS"
else
   echo "FAIL"
   exit 1
fi
