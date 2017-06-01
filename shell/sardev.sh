while true;
do
echo "----------------" >> networkdelay.txt;
sar -n DEV 1 1 | grep eth2 | grep -v Average >> networkdelay.txt;
queuetop -1 | grep IMS_P_UMS[0-9]  | awk -F ' ' '{s+=$4} END {print s/500}' >> networkdelay.txt;
perf  trace -e sendto | grep UMStppd |  awk -F ' ' '{print $3}'  | grep -v '0.' >> networkdelay.txt;
done
