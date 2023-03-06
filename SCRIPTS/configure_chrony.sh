#!/bin/bash

if [ "$ACTION" == "harden" ]; then
   if ! grep -q "configured" /etc/chrony.conf; then
      c="$(cat /etc/chrony.conf | grep -v pool)"
      echo "server ntp1.boystown.org iburst maxpoll 16" > /etc/chrony.conf
      echo "server ntp2.boystown.org iburst maxpoll 16" >> /etc/chrony.conf
      echo "server ntp3.boystown.org iburst maxpoll 16" >> /etc/chrony.conf
      echo "$c" >> /etc/chrony.conf
      echo "#configured" >> /etc/chrony.conf
   fi
fi
