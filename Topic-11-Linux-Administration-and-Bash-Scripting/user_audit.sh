#!/bin/bash

echo "Username,Last Login" > user_logins.csv

for user in $(cut -d: -f1 /etc/passwd); do
    shell=$(getent passwd "$user" | cut -d: -f7)
    if [[ "$shell" != "/usr/sbin/nologin" && "$shell" != "/bin/false" ]]; then
        last_login=$(lastlog -u "$user" | awk 'NR==2 {print $4, $5, $6}')
        echo "$user,$last_login" >> user_logins.csv
    fi
done

column -t -s, user_logins.csv
