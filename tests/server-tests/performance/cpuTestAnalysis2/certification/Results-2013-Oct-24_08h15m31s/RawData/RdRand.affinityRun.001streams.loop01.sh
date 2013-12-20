#!/bin/bash -v
RESULTS_DIR=`pwd`
pushd ../..
NOSTREAMS=1
LOOP_CNT=1
CNT=1
TESTFILE=`printf "${RESULTS_DIR}/RdRand.affinityRun.%03dstreams.loop%02d.instance%03d.SOCKET%02d.CORE%03d.PU%02d.log" $NOSTREAMS $LOOP_CNT $CNT 0 1 1`
 taskset 0x2 /root/RdRand /dev/null -t 1 -d 3 -c 3 ${SEM_ID} > ${TESTFILE} 2>&1 &
PIDS=`echo $PIDS " " $!`
MPSTAT_LOGFILE=`printf "${RESULTS_DIR}/RdRand.affinityRun.%03dstreams.loop%02d.mpstat" $NOSTREAMS $LOOP_CNT`
mpstat -P ALL 2 >& ${MPSTAT_LOGFILE} &
MPSTATPID=$!
wait ${PIDS}
kill ${MPSTATPID}
popd
