#!/bin/bash

rtcdate=$(hwclock -l)
unix_rtcdate=$(date -d "${rtcdata}" "+%s")
unix_systemdate=$(date "+%s")
if [ ${unix_rtcdate} -ge ${unix_systemdata} ]; then
   echo "Restoring system time from RTC"
   hwclock --hctosys
else
   echo "System time is ahead of RTC, not restoring"
fi

while : ; do date; sleep ${INTERVAL:-15}; done
