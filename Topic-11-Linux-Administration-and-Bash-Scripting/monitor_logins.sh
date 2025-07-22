#!/bin/bash

LOG_FILE="/var/log/auth.log"
OUTPUT_FILE="/tmp/login_failures.txt"

grep "Failed password" "$LOG_FILE" | awk '{print $(NF-3)}' | sort | uniq -c | sort -nr > "$OUTPUT_FILE"

echo "[INFO] Report generated at $OUTPUT_FILE"
