#!/bin/bash
# In this example we count files that are max 7 days old
# In this example we need to have 18 files. 
# I made this script in Debian 9

    count=(find /path/to/backups/* -maxdepth 0 -mtime -7 | wc -l)
    if [ $count == 18 ] ; then
        status=0
        statustxt=OK
    elif [ $count -lt 18 ] ; then  
        status=1
        statustxt=WARNING
    else
        status=2
        statustxt=CRITICAL
    fi
    echo "$statustxt $count of 18 files in backups"