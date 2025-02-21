#!/bin/bash

TOOL_NAME="log-archive"

# Making script callable from anywhere in system
if [ "$(which $TOOL_NAME)" != "/usr/local/bin/$TOOL_NAME" ]; then
    echo "Installing $TOOL_NAME in /usr/local/bin"
    sudo cp $(realpath "$0") /usr/local/bin/$TOOL_NAME
fi

# Checking if input dir was provided
if [ $# -eq 0 ]; then
    echo "Provide directory to archive"
    exit 1
fi

INPUT_DIR=$1
OUTPUT_DIR="/var/log"

# Archiving process
tar -czvf $OUTPUT_DIR/logs_archive_$(date +"%Y%m%d_%H%M%S").tar.gz $INPUT_DIR
