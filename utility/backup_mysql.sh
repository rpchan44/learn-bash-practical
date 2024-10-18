#!/bin/bash

# Database credentials
DB_USER="username"
DB_PASS="password"
DB_NAME="database"

# Backup directory
BACKUP_DIR="/path/to/backup"
DATE=$(date +"%Y%m%d%H%M")

# Create backup directory if it doesn't exist
mkdir -p "$BACKUP_DIR"

# Perform the backup
mysqldump -u "$DB_USER" -p"$DB_PASS" "$DB_NAME" > "$BACKUP_DIR/$DB_NAME-$DATE.sql"

# Check if the backup was successful
if [ $? -eq 0 ]; then
    echo "Backup successful: $BACKUP_DIR/$DB_NAME-$DATE.sql"
else
    echo "Backup failed!"
    exit 1
fi
