# Linux Administration and Bash Automation

This module includes key Bash scripts for monitoring login attempts, auditing user access, checking system service health, and scheduling jobs via cron.

## Files
- `monitor_logins.sh`: Extracts failed login attempts.
- `user_audit.sh`: Lists users with shell access and recent logins.
- `healthcheck.sh`: Ensures key services are running, restarts them if needed.
- `crontab_entry.txt`: Cron job to run health checks.
- `bonus_expect_disk_check.sh`: Automates SSH into a remote server and checks disk space (optional).

## Setup
1. Make all scripts executable:
   ```bash
   chmod +x *.sh
