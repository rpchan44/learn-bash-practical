#!/bin/bash

# Database credentials
DB_USER="username"
DB_PASS="password"
DB_NAME="database"

# Backup file to restore
BACKUP_FILE="/path/to/backup/your_backup_file.sql"

# Restore the database
mysql -u "$DB_USER" -p"$DB_PASS" "$DB_NAME" < "$BACKUP_FILE"

# Check if the restore was successful
if [ $? -eq 0 ]; then
    echo "Restore successful from $BACKUP_FILE"
else
    echo "Restore failed!"
    exit 1
fi
