#!/bin/bash

rtcdate=$(hwclock -l)
# required to format the date string on busybox
rtcdate="${rtcdate%%0.000000 seconds}"
unix_rtcdate=$(date -d "${rtcdate}" "+%s")
unix_systemdate=$(date "+%s")
if [ "${unix_rtcdate}" -gt "${unix_systemdate}" ]; then
   echo "Restoring system time from RTC"
   hwclock --hctosys
else
   echo "System time is ahead of RTC, not restoring"
fi

while : ; do date; sleep "${INTERVAL:-15}"; done
