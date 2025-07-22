#!/bin/bash

SERVICES=("nginx" "sshd" "docker")
LOGFILE="/var/log/service_healthcheck.log"
DATE=$(date '+%Y-%m-%d %H:%M:%S')

for service in "${SERVICES[@]}"; do
    systemctl is-active --quiet "$service"
    if [[ $? -ne 0 ]]; then
        echo "$DATE - $service was inactive. Restarting..." | tee -a "$LOGFILE"
        systemctl restart "$service"
        logger "$service restarted by healthcheck.sh"
    else
        echo "$DATE - $service is running." >> "$LOGFILE"
    fi
done
