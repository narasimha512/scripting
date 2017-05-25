#!/usr/bin/env python

import subprocess
import optparse

parser = optparse.OptionParser()
parser.add_option('-d', '--dev', dest='dev', help='Device Name')

(options, args) = parser.parse_args()

print options.dev

command = "cat /proc/interrupts | grep " + options.dev + " | awk -F ' ' '{s+=$2+$3+$4+$5+$6+$7+$9} END {print s}'"

prev_out = 0
while 1:
        p = subprocess.Popen(command, stdout=subprocess.PIPE, shell=True)
        (output, err) =  p.communicate()
        delta = int(output) - prev_out
        prev_out = int(output)
        print "interrupts generated during this time " , delta
        subprocess.call(["sleep", "1"])
