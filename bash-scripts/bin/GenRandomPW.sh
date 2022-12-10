#!/usr/bin/env bash

usr=$1
pw=`< /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c12`
echo "Will set password $pw for user $usr"

echo "$usr:$pw" | chpasswd
