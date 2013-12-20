#!/usr/bin/env bash
#vim: set expandtab cindent fdm=marker ts=2 sw=2:

#Collect periodically perf statistics. To be analyzed with perf report -i <file> later
#Usage is similar as with mpstat
#       PERF_LOGFILE=`printf "${RESULTS_DIR}/${PROGNAME}.${TESTTYPE}.%03dstreams.loop%02d.perf" $NOSTREAMS $LOOP_CNT`
#       ./perf_record.sh ${PERF_LOGFILE} &
#       PERF_PID=$!
#       kill ${PERF_PID}
#       sleep 30

#Usage ./perf_record.sh ${PERF_LOGFILE} &


for ((x=0; x<=4; x++))
{
	perf record -g -F1000 -a -o $1.$x sleep 30
}
