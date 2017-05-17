rm -f /home/rtp99/99/trace/RtpTrcError.*
kill -9 `ps -eaf | grep RtpTrcMgr01 | grep -v grep | awk '{printf $2}'`
kill -9 `ps -eaf | grep RtpTrcRdrSync01 | grep -v grep | awk '{printf $2}'`
kill -9 `ps -eaf | grep RtpTrcRdrAsync01 | grep -v grep | awk '{printf $2}'`

