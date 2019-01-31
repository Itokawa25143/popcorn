#!/bin/bash
# Script that shows if Fail2ban is installed and banned IP's
# Created by Jaanika Muurisepp
# List of servers:
servers="user@server user@server2 user@serverN"
#Check hostname and if Fail2ban is installed or not
for server in $servers; do
  ssh $server "
        hostname
        dpkg -s fail2ban &> /dev/null
        if [ $? -eq 0 ]; then
           : #do nothing
        else
            echo "Fail2ban not installed"
        fi
"
#Check banned IP's. 
ssh $server fail2ban-client status sshd | grep "Banned" | awk '{$1=""; print $0}'
done

# Check localhost
hostname
dpkg -s fail2ban &> /dev/null
    if [ $? -eq 0 ]; then
        :
    else
        echo "Package  is NOT installed!"
    fi
fail2ban-client status sshd | grep "Banned" | awk '{$1=""; print $0}'