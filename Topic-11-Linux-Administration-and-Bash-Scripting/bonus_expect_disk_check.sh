
---

## ⭐ Bonus: `bonus_expect_disk_check.sh`

```bash
#!/usr/bin/expect -f

set timeout 10
set host "remote-host"
set user "youruser"
set password "yourpassword"

spawn ssh $user@$host
expect "password:"
send "$password\r"
expect "$ "
send "df -h\r"
expect "$ "
send "exit\r"
