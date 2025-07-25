#!/bin/bash
# monitor_logins.sh - Scans auth log for failed login attempts

LOG_FILE="/var/log/auth.log"
OUTPUT="/tmp/login_failures.txt"

echo "Failed login attempts (from $LOG_FILE)" > "$OUTPUT"
grep "Failed password" "$LOG_FILE" | awk '{print $1, $2, $3, $9, $11}' >> "$OUTPUT"

echo "Report written to $OUTPUT"