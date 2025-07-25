
# Topic 11 (Advanced): Linux Administration and Bash Scripting

## What You’ll Learn
- Mastering core Linux administration tools
- Automate daily tasks using Bash scripts
- Parse log files, manage processes, and user roles programmatically
- Write idempotent scripts for system configuration

---

## Advanced Concepts Covered
- Cron jobs and scheduling scripts
- Error handling and logging in Bash
- Conditional execution and command chaining (`&&`, `||`, `set -e`)
- Text processing tools: `awk`, `sed`, `cut`, `xargs`
- Basic use of expect scripts for automating interactive CLI tasks (optional)

---

## Tasks

### 1. Log File Monitoring Script – `monitor_logins.sh`
- Scans `/var/log/syslog` or `/var/log/auth.log`
- Filters out failed login attempts
- Writes summary report to `/tmp/login_failures.txt`

### 2. User Audit Script – `user_audit.sh`
- Lists all users with shell access
- Verifies logins in the past 7 days
- Outputs to CSV using `column` or plain `.csv`

### 3. Service Health Check – `healthcheck.sh`
- Checks if key services (e.g., `nginx`, `sshd`, `docker`) are running
- Restarts them if not active and logs the event
- Uses `systemctl`, `tee`, and `logger`

### 4. Scheduled Task – `crontab.txt`
- A cron job that runs one of the scripts every 15 minutes
- Logs output to `/var/log/custom/healthcheck_<timestamp>.log`

### 5. Bonus: SSH Disk Check – `check_disk_remote.exp`
- Automates SSH login using `expect`
- Executes `df -h` remotely
- Logs only the disk usage report into `logs/`

---

## File Structure

```
Topic-11-Linux-Administration-and-Bash-Scripting/
├── monitor_logins.sh
├── user_audit.sh
├── healthcheck.sh
├── check_disk_remote.exp  # (Optional bonus)
├── crontab.txt
├── logs/
│   ├── cron_healthcheck.log
│   ├── disk_check_<host>_<timestamp>.log
│   └── healthcheck_<timestamp>.log
└── README.md
```

---

## Setup Instructions

1. Give execute permission to scripts:
   ```bash
   chmod +x monitor_logins.sh user_audit.sh healthcheck.sh
   ```

2. Test each script locally:
   ```bash
   ./monitor_logins.sh
   ./user_audit.sh
   ./healthcheck.sh
   ```

3. To schedule a cron job:
   ```bash
   crontab crontab.txt
   ```

4. Run the SSH disk check script:
   ```bash
   ./check_disk_remote.exp <user> <host> <password>
   ```

---

## Logs & Output
- Disk check logs: `logs/disk_check_<ip>_<timestamp>.log`
- Healthcheck logs: `logs/healthcheck_<timestamp>.log`
- Cron job logs: `logs/cron_healthcheck.log`