#!/bin/bash
# healthcheck.sh - Checks and restarts key services with debug output

# Define log directories
SERVICES=("apache2" "docker" "cron" "cups" "rsyslog")
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
LOG_DIR="$SCRIPT_DIR/logs"
mkdir -p "$LOG_DIR"
LOG_FILE="$LOG_DIR/healthcheck_$(date +%F_%T).log"
DEBUG_LOG="$LOG_DIR/cron_healthcheck.log"

# Start debug log
echo "== $(date): Cron job started ==" >> "$DEBUG_LOG"

for service in "${SERVICES[@]}"; do
    echo "$(date): Checking $service..." >> "$DEBUG_LOG"
    systemctl is-active --quiet "$service"
    if [ $? -ne 0 ]; then
        echo "$(date): $service was down. Restarting..." | tee -a "$LOG_FILE" >> "$DEBUG_LOG"
        sudo systemctl restart "$service" >> "$DEBUG_LOG" 2>&1
        logger "$service restarted by healthcheck script"
    else
        echo "$(date): $service is running" >> "$LOG_FILE"
        echo "$(date): $service OK " >> "$DEBUG_LOG"
    fi
done

echo "== $(date): Cron job finished ==" >> "$DEBUG_LOG"
