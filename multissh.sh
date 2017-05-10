#!/bin/sh


tmpdir=${TMPDIR:-/tmp}/pssh.$$
mkdir -p $tmpdir
count=0
while IFS= read -r userhost; do
    ssh -n -o BatchMode=yes $2@${userhost} $3 > ${tmpdir}/${userhost} 2>&1 &
    #expect "assword:"
    #send "yt_xk39b\r"
    count=`expr $count + 1`
done < $1.lst
while [ $count -gt 0 ]; do
    wait $pids
    count=`expr $count - 1`
done
echo "Output for hosts are in $tmpdir"

while IFS= read -r userhost; do
cat ${tmpdir}/${userhost}

done < $1.lst
