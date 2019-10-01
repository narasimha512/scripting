#!/bin/sh

log_netstat()
{
PORT=$1
NOW=$(date +"%m-%d-%Y-%H-%M")
FILE="$2/$NOW.log"
NOW_SEC=$(date +"%m-%d-%Y-%H-%M-%S")
echo "Time: $NOW_SEC" >> $FILE
RQ=$(expr $(netstat -anp | grep $PORT| awk -F ' ' '{s+=$2} END {print s}') / 1000)
SQ=$(expr $(netstat -anp | grep $PORT| awk -F ' ' '{s+=$3} END {print s}') / 1000)
echo "RQ $RQ KB SQ $SQ KB" >> $FILE
netstat -anp | grep $PORT >> $FILE
}

while [ TRUE ]
do
log_netstat 16611 /data0/16611/
log_netstat 8080 /data0/8080/
sleep 1
done
