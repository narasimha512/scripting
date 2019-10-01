#!/bin/sh

while [ TRUE ]
do
NOW=$(date +"%m-%d-%Y-%H-%M")
FILE="//var/opt/sdf/$NOW.log"
NOW_SEC=$(date +"%m-%d-%Y-%H-%M-%S")
echo "Time: $NOW_SEC" >> $FILE
netstat -anp | grep 16611 >> $FILE
sleep 1
done
