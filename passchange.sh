#!/bin/bash
str0="$$"
for i in `more list.txt `
do
POS=2
LEN=16 # Make password 16 characters.
str1=$( echo "$str0" | md5sum | md5sum )
randstring="${str1:$POS:$LEN}"
let str0=str0+5
echo "$i $randstring" >> newpass.txt
/scripts/chpass $i $randstring && /scripts/mysqlpasswd $i $randstring
done
