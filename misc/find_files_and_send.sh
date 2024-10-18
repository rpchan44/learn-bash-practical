#!/bin/bash

# Define the output archive name
ARCHIVE_NAME="large_jpg_files.tar.gz"

# Define the rsync server details
RSYNC_USER="your_username"
RSYNC_SERVER="your_rsync_server"
RSYNC_DESTINATION="/path/to/destination"

# Find and compress .xls,.xlsx,.doc,.docx
find . -type f \( -name "*.xls" -o -name "*.xlsx" -o -name "*.doc" -o -name "*.docx" -print0 | tar -czvf "$ARCHIVE_NAME" --null -T -

# Check if compression was successful
if [ $? -eq 0 ]; then
    echo "Compression successful. Sending to rsync server..."

    # Use rsync to transfer the archive to the remote server
    rsync -avz "$ARCHIVE_NAME" "${RSYNC_USER}@${RSYNC_SERVER}:${RSYNC_DESTINATION}"

    if [ $? -eq 0 ]; then
        echo "File successfully sent to $RSYNC_SERVER."
    else
        echo "Failed to send the file to $RSYNC_SERVER."
    fi
else
    echo "Compression failed. No files were sent."
fi
