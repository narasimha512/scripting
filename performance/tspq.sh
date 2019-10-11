#!/bin/sh
MAX=0
while [ TRUE ]
do
float=$(queuetop -1 | grep UECM[0-1]  | awk -F ' ' '{s+=$4} END {print s/500}') 
COUNT=${float%.*}
if [ $COUNT -ge $MAX ]
then
	MAX=$COUNT
	echo "Max count is $MAX"
fi

done;
