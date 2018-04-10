#!/bin/bash

# Parse RTC date into unixtime
rtcdate=$(hwclock -l)
# required to format the date string on busybox date, not requir
unix_rtcdate=$(date -D "%c" -d "${rtcdate}" "+%s")
# With coreutils date the conversion should be
# unix_rtcdate=$(date -d "${rtcdate}" "+%s")

# Get current system unixtime
unix_systemdate=$(date "+%s")

# Only restore time if it's ahead of system time
if [ "${unix_rtcdate}" -gt "${unix_systemdate}" ]; then
   echo "Restoring system time from RTC"
   hwclock --hctosys
else
   echo "System time is ahead of RTC, not restoring"
fi

## Do the main payload
while : ; do date; sleep "${INTERVAL:-15}"; done
