#!/bin/sh

COUNT=1

while [ TRUE ]
do
tcpdump -i any -w /data0/sdm_ldap_delay_issue_$COUNT.pcap port 16611 -c 1000000
let "COUNT++"
done;
