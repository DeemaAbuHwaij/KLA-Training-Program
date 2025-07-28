#!/bin/bash
# user_audit.sh - Audit users with shell access in last 7 days

echo "Username,Last Login" > user_audit_report.csv

seven_days_ago=$(date --date="7 days ago" +%s)

grep -vE "/false|/nologin" /etc/passwd | cut -d: -f1,7 | while IFS=: read user shell; do
    login_info=$(lastlog -u "$user" | awk 'NR==2 {print $4, $5, $6, $7, $8}')
    if [[ "$login_info" == "**Never" ]]; then
        last_login="Never logged in"
    else
        login_date=$(echo $login_info | awk '{print $1, $2, $3}')
        login_ts=$(date -d "$login_date" +%s 2>/dev/null)
        if [[ $login_ts -ge $seven_days_ago ]]; then
            last_login="$login_info"
        else
            last_login=">7 days ago"
        fi
    fi
    echo "$user,$last_login" >> user_audit_report.csv
done

column -s, -t user_audit_report.csv
