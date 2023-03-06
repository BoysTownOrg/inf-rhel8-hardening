#!/bin/bash

REQ_MOUNTS="$(cat MOUNTS)"

MOUNTS=$(mount | cut -f3 -d' ')

for m in ${REQ_MOUNTS}; do
   echo "$MOUNTS" | grep -q "^${m}\$"
   if [ $? -ne 0 ]; then
      echo "Missing required mount point ${m}!"
      exit 1
   fi
done
   
PACKAGE_REMOVE="$(cat PACKAGES | grep "^!" | sed 's/!//')"
PACKAGE_INSTALL="$(cat PACKAGES | grep -v "^!")"

if [ "$ACTION" == "harden" ]; then
   yum erase -y $PACKAGE_REMOVE
   yum install -y $PACKAGE_INSTALL
fi

PACKAGE_FLAG=0
for p in $PACKAGE_REMOVE; do
   rpm -q "$p" >/dev/null
   if [ $? -eq 0 ]; then
      echo "Package $p needs to be removed!"
      PACKAGE_FLAG=1
   fi
done
for p in $PACKAGE_INSTALL; do
   rpm -q "$p" >/dev/null
   if [ $? -ne 0 ]; then
      echo "Package $p needs to be installed!"
      PACKAGE_FLAG=1
   fi
done

if [ "$PACKAGE_FLAG" -eq 1 ]; then
   echo "FAIL"
   exit 1
fi

./SCRIPTS/configure_chrony.sh

echo "PASS"
