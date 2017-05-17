#!/bin/bash

clean()
{

  > report_sar_cpu.log
  > report_sar_dev.log 
  > report_counters.log 
  > report_dump_log.log
  rm -f /home/rtp99/99/RtpTrcError/RtpTrcError.*

  kill -9 `ps -eaf | grep RtpTrcMgr01 | grep -v grep | awk '{printf $2}'`
  kill -9 `ps -eaf | grep RtpTrcRdrSync01 | grep -v grep | awk '{printf $2}'`
  kill -9 `ps -eaf | grep RtpTrcRdrAsync01 | grep -v grep | awk '{printf $2}'`

}

counter_stat()
{
  /home/rtp99/CounterInfo/counter_output.sh > report_counters.log &
}

dump_log()
{
   RtpDumpLog -f > report_dump_log &
}

clean
counter_stat
dump_log

while [ true ]
do
  sar -n DEV 1 5 | tee -a report_sar_dev.log 
  sar 1 5 | tee -a report_sar_cpu.log 
sleep 1
done

