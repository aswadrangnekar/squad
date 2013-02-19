#!/bin/sh
#
#   comments
#
#   Usage:
#

CMD_ARG1=$1
CMD_ARG2=$2
NOW=`date +%s`

if [[ "$CMD_ARG1" == "start" ]]; then
    echo "$CMD_ARG1"
elif [[ "$CMD_ARG2" == "something" ]]; then
    echo "$CMD_ARG2"
else
    echo "Usage: $0 [start/stop] [something]"
fi
