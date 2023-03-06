#!/bin/bash

if [ $# -ne 1 ]; then
   echo "Usage: $0 <harden|check>"
   exit 1
fi

if echo $1 | grep -q -i harden; then
   export ACTION="harden"
fi

if echo $1 | grep -q -i check; then
   export ACTION="check"
fi

if [ "$ACTION" == "" ]; then
   echo "Invalid paramater for action, needs to be 'harden' or 'check'"
   echo 1
fi

declare -A STATUS

echo "Checking prerequisites"
./SCRIPTS/prereq.sh
if [ $? -eq 0 ]; then
   STATUS["prereq"]="PASS"
else
   STATUS["prereq"]="FAIL"
fi

IFS="|"
while read STIG DESC S; do
   if [ "$S" != "Open" ]; then continue; fi
   echo "Checking STIG ${STIG}: $DESC"
   if [ -x SCRIPTS/${STIG}.sh ]; then
      ./SCRIPTS/${STIG}.sh
      if [ $? -eq 0 ]; then
         STATUS["$STIG"]="PASS"
      else
         STATUS["$STIG"]="FAIL"
      fi
   else
      echo "Missing script to check or implement ${STIG}!"
      STATUS["$STIG"]="FAIL"
   fi
done < <(cat STIG_LIST)

PASS=0
FAIL=0
echo "########## STATUS ##########"
for stig in ${!STATUS[@]}; do
   echo "$stig ${STATUS[$stig]}"
   if [ "${STATUS[$stig]}" == "PASS" ]; then
      ((PASS++))
   else
      ((FAIL++))
   fi
done 

echo "PASS: $PASS   FAIL: $FAIL"

if [ "$FAIL" -gt 0 ]; then exit 1; fi
