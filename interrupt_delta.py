#!/usr/bin/env python

import subprocess
import optparse

parser = optparse.OptionParser()
parser.add_option('-d', '--dev', dest='dev', help='Device Name')

(options, args) = parser.parse_args()

print options.dev

dia = "cat /proc/interrupts | grep virtio2-in | awk -F ' ' '{s+=$2+$3+$4+$5+$6+$7+$9} END {print s}'"
icm = "cat /proc/interrupts | grep virtio0-in | awk -F ' ' '{s+=$2+$3+$4+$5+$6+$7+$9} END {print s}'"

prev_dia = 0
prev_icm = 0
op = 0

def intr_delta(command):
        p = subprocess.Popen(command, stdout=subprocess.PIPE, shell=True)
        (output, err) =  p.communicate()
        return int(output)


while 1:
        op = intr_delta(dia)
        dia_delta = op - prev_dia
        prev_dia = op
        op = intr_delta(icm)
        icm_delta = op - prev_icm
        prev_icm = op
        print " INTR DIA " , dia_delta, " INTR ICM ", icm_delta
        subprocess.call(["sleep", "1"])
