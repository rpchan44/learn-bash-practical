#!/bin/bash

# Backup directory (the directory from which you want to restore)
BACKUP_DIR="/path/to/backup/backup-YYYYMMDDHHMM"

# Destination directory (where you want to restore the files)
DEST_DIR="/path/to/restore"

# Restore the backup using rsync
rsync -av --delete "$BACKUP_DIR/" "$DEST_DIR/"

# Check if the restore was successful
if [ $? -eq 0 ]; then
    echo "Restore successful from $BACKUP_DIR to $DEST_DIR"
else
    echo "Restore failed!"
    exit 1
fi
