#!/bin/bash

#TODO: 
# - change not track-message to count lines (less than 2 means no task tracked)
# - display number of tasks, click on it show other tasks
# - replace the 'Status        Tracked Name' String with something more generic

ARC_RESP=$(arc time)
#ARC_RESP="Status        Tracked Name
#(In Progress)       1 T942: General Support Stuff"
OUTPUT=;
NO_TRACK_MSG="Not currently tracking time against any object."
EXCPTN_MSG=" Exception 
[cURL/7] (https://phab.prime-research.local/api/user.whoami) <CURLE_COULDNT_CONNECT> The cURL library raised an error while making a request. You may be able to find more information about this error (error code: 7) on the cURL site: http://curl.haxx.se/libcurl/c/libcurl-errors.html#CURLECOULDNTCONNECT
(Run with \`--trace\` for a full exception trace.)"
EXCPTN_MSG="The cURL library raised an error while making a request."
if [[ "$ARC_RESP" =~ *"$EXCPTN_MSG"* ]]; then
    OUTPUT="phab not reachable"
    echo $OUTPUT
    exit 1
fi
if [ "$ARC_RESP" == "$NO_TRACK_MSG" ]; then
    OUTPUT=" -- "

else
    TASKS="${ARC_RESP//'Status        Tracked Name'}"
    OUTPUT=$(echo "$TASKS" | sed -r "s/^(.+)T/T/")
fi

echo $OUTPUT
exit 0
