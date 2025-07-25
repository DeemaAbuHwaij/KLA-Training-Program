#!/bin/bash
# user_audit.sh - Lists users with shell access and checks last login

echo "Username,Last Login" > user_audit_report.csv

# Get users with shell access
grep -vE "/false|/nologin" /etc/passwd | cut -d: -f1,7 | while IFS=: read user shell; do
    last_login=$(lastlog -u "$user" | awk 'NR==2 {print $4, $5, $6}')
    echo "$user,$last_login" >> user_audit_report.csv
done

column -s, -t user_audit_report.csv