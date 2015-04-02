#!/bin/bash
CPUSERS=`ls -1A /var/cpanel/users/`
INBOXFOLDERS=(.Trash .Junk .Spam)
for eachuser in $CPUSERS; do
  MAILDIR=$(find /home/$eachuser/mail/*/* -maxdepth 0 -type d)
  for eachdir in $MAILDIR; do
    for ((i = 0; i < ${#INBOXFOLDERS[*]}; i++)); do
      for dir in cur new; do
        echo "rm -f $eachdir/${INBOXFOLDERS[$i]}/$dir/*"
        rm -f $eachdir/${INBOXFOLDERS[$i]}/$dir/*
        #find "$eachdir/${INBOXFOLDERS[$i]}/$dir/" -type f -mtime +3 -delete
      done
    done
  done
done
#/scripts/generate_maildirsize --verbose --allaccounts --force --confirm
