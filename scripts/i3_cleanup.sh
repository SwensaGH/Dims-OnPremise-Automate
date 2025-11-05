#!/bin/bash

#i3_cleanup.sh - Compress uncompressed files in selected directories and clean up old backups

# Set base directory
BASE_DIR="/opt/dims/scheduler_backup"

# Subdirectories to process
SUBDIRS=("inventory" "mdm" "network")

# MySQL dump directory
MYSQLDUMP_DIR="/opt/tools/mysqldump"

# Logs directory
LOG_DIR="/var/log/fluentd/pod-logs"

echo "Starting cleanup process..."

# Step 1: Compress files in specified subdirectories
echo "Compressing uncompressed files older than 5 days..."
for dir in "${SUBDIRS[@]}"; do
  TARGET_DIR="$BASE_DIR/$dir"
  if [[ -d "$TARGET_DIR" ]]; then
    find "$TARGET_DIR" -type f ! -name '*.gz' -mtime +5 -exec bash -c '
      file="$1"
      if [[ ! -f "$file.gz" ]]; then
        echo "Compressing: $file"
        gzip "$file"
      fi
    ' _ {} \;
  else
    echo "Directory not found: $TARGET_DIR"
  fi
done

# Step 2: Delete files older than 60 days in all subdirectories
echo "Removing files older than 60 days from all target directories..."
for dir in "${SUBDIRS[@]}"; do
  TARGET_DIR="$BASE_DIR/$dir"
  if [[ -d "$TARGET_DIR" ]]; then
    find "$TARGET_DIR" -type f -mtime +60 -exec rm -v {} \;
  else
    echo "Directory not found: $TARGET_DIR"
  fi
done

# Step 3a: Compress MySQL dump .sql files if not already compressed
echo "Compressing MySQL dump .sql files in $MYSQLDUMP_DIR..."
if [[ -d "$MYSQLDUMP_DIR" ]]; then
  find "$MYSQLDUMP_DIR" -type f -name '*.sql' -exec bash -c '
    file="$1"
    if [[ ! -f "$file.gz" ]]; then
      echo "Compressing MySQL dump: $file"
      gzip "$file"
    fi
  ' _ {} \;
else
  echo "Directory not found: $MYSQLDUMP_DIR"
fi

# Step 3b: Delete compressed .sql.gz files older than 10 days
echo "Removing MySQL dump .sql.gz files older than 10 days from $MYSQLDUMP_DIR..."
if [[ -d "$MYSQLDUMP_DIR" ]]; then
  find "$MYSQLDUMP_DIR" -type f -name '*.sql.gz' -mtime +10 -exec rm -v {} \;
else
  echo "Directory not found: $MYSQLDUMP_DIR"
fi

# Step 4a: Compress .log files in subdirectories if not already compressed
echo "Compressing .log files in $LOG_DIR subdirectories..."
if [[ -d "$LOG_DIR" ]]; then
  for TARGET_DIR in "$LOG_DIR"/dims* "$LOG_DIR"/scheduler* "$LOG_DIR"/mysql* "$LOG_DIR"/inventory*; do
    if [[ -d "$TARGET_DIR" ]]; then
      find "$TARGET_DIR" -type f -name '*.log' -mtime +0 -exec bash -c '
        file="$1"
        if [[ ! -f "$file.gz" ]]; then
          echo "Compressing log: $file"
          gzip "$file"
        fi
      ' _ {} \;
    fi
  done
else
  echo "Directory not found: $LOG_DIR"
fi

# Step 4b: Delete compressed .log.gz files older than 30 days in subdirectories
echo "Removing .log.gz files older than 30 days from $LOG_DIR subdirectories..."
if [[ -d "$LOG_DIR" ]]; then
  for TARGET_DIR in "$LOG_DIR"/dims* "$LOG_DIR"/scheduler* "$LOG_DIR"/mysql* "$LOG_DIR"/inventory*; do
    if [[ -d "$TARGET_DIR" ]]; then
      find "$TARGET_DIR" -type f -name '*.log.gz' -mtime +30 -exec rm -v {} \;
    fi
  done
else
  echo "Directory not found: $LOG_DIR"
fi

echo "Cleanup process completed."
