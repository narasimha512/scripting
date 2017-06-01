#!/usr/bin/env python

import subprocess
import optparse

parser = optparse.OptionParser()
parser.add_option('-d', '--dev', dest='dev', help='Device Name')

(options, args) = parser.parse_args()

print options.dev

dia = "cat /proc/interrupts | grep virtio2-in | awk -F' ' '{print $1}' | awk -F':' '{print $1}'"
icm = "cat /proc/interrupts | grep virtio0-in | awk -F' ' '{print $1}' | awk -F':' '{print $1}'"


def  exec_com(command):
        p = subprocess.Popen(command, stdout=subprocess.PIPE, shell=True)
        (output, err) =  p.communicate()
        print output

def intr_delta(command):
        str=""
        p = subprocess.Popen(command, stdout=subprocess.PIPE, shell=True)
        (output, err) =  p.communicate()
        data=output.split()
        for line in data:
                str +=line+","
        return str


while 1:
        dia_intr = intr_delta(dia)
        icm_intr = intr_delta(icm)

        dia_sar = "sar -I " + dia_intr + " 1 1"
        icm_sar = "sar -I " + icm_intr + " 1 1"

        #print dia_sar
        #print icm_sar

        exec_com(dia_sar)
        exec_com(icm_sar)
        subprocess.call(["sleep", "1"])
