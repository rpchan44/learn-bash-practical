#!/bin/bash

# Source directory (the directory you want to back up)
SOURCE_DIR="/path/to/source"

# Destination directory (where you want to store the backup)
DEST_DIR="/path/to/backup"

# Date format for backup folder
DATE=$(date +"%Y%m%d%H%M")

# Create a backup using rsync
rsync -av --delete "$SOURCE_DIR/" "$DEST_DIR/backup-$DATE/"

# Check if the backup was successful
if [ $? -eq 0 ]; then
    echo "Backup successful: $DEST_DIR/backup-$DATE/"
else
    echo "Backup failed!"
    exit 1
fi
