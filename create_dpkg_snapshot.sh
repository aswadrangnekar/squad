#!/bin/sh
#
#   Takes snapshot of the installed packages
#
#   Usage: ./create_dpkg_snapshot.sh
#

SNAPSHOT_FILE_PATH="/tmp/dpkg_snapshots/$(date +%Y-%m-%d)"

# Create the dir if not present
if [ ! -f "$SNAPSHOT_FILE_PATH" ]; then
    mkdir -p "`dirname \"$SNAPSHOT_FILE_PATH\"`" 2>/dev/null
fi

# Writes current dpkg names to path/to/file 
dpkg --get-selections | grep -v deinstall > $SNAPSHOT_FILE_PATH
