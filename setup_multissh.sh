#!/bin/bash

read -s PWD

for host in $(cat all.lst);
do
/usr/bin/expect <<EOD
spawn ssh-copy-id $1@$host;
expect "password"
send "$PWD\n"
EOD
done;
echo "you're out"
