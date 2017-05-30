#!/usr/bin/env python

import subprocess

recvq_com = "ss -t4 sport = 3868 | awk -F ' ' '{s+=$2} END {print s}'"
sendq_com = "ss -t4 sport = 3868 | awk -F ' ' '{s+=$3} END {print s}'"
icmq_com = "ss -t6 sport = 13014 | awk -F ' ' '{s+=$2} END {print s}'"

def exec_comand(command):
        p = subprocess.Popen(command, stdout=subprocess.PIPE, shell=True)
        (output, err) =  p.communicate()
        return int(output)


while 1:
        rxq = exec_comand(recvq_com)
        txq = exec_comand(sendq_com)
        icmq = exec_comand(icmq_com)
        print "RX Q " , rxq, " TX Q ", txq, " ICM Q " , icmq


        subprocess.call(["sleep", "1"])
