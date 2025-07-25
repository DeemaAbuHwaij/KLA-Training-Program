#!/bin/bash
# Wrapper to run the expect script

if [ "$#" -ne 3 ]; then
  echo "Usage: $0 <username> <host> <password>"
  exit 1
fi

./check_disk_remote.exp "$1" "$2" "$3"