#!/bin/bash -v
RESULTS_DIR=`pwd`
pushd ../..
NOSTREAMS=4
LOOP_CNT=1
CNT=1
TESTFILE=`printf "${RESULTS_DIR}/RdRandnumaRun.%03dstreams.loop%02d.instance%03d.node%03d.log" $NOSTREAMS $LOOP_CNT $CNT 0`
 numactl --cpunodebind=0 --membind=0 /root/RdRand /dev/null -t 1 -d 3 -c 3 ${SEM_ID} > $TESTFILE 2>&1 &
PIDS=`echo $PIDS " " $!`
CNT=2
TESTFILE=`printf "${RESULTS_DIR}/RdRandnumaRun.%03dstreams.loop%02d.instance%03d.node%03d.log" $NOSTREAMS $LOOP_CNT $CNT 1`
 numactl --cpunodebind=1 --membind=1 /root/RdRand /dev/null -t 1 -d 3 -c 3 ${SEM_ID} > $TESTFILE 2>&1 &
PIDS=`echo $PIDS " " $!`
CNT=3
TESTFILE=`printf "${RESULTS_DIR}/RdRandnumaRun.%03dstreams.loop%02d.instance%03d.node%03d.log" $NOSTREAMS $LOOP_CNT $CNT 2`
 numactl --cpunodebind=2 --membind=2 /root/RdRand /dev/null -t 1 -d 3 -c 3 ${SEM_ID} > $TESTFILE 2>&1 &
PIDS=`echo $PIDS " " $!`
CNT=4
TESTFILE=`printf "${RESULTS_DIR}/RdRandnumaRun.%03dstreams.loop%02d.instance%03d.node%03d.log" $NOSTREAMS $LOOP_CNT $CNT 3`
 numactl --cpunodebind=3 --membind=3 /root/RdRand /dev/null -t 1 -d 3 -c 3 ${SEM_ID} > $TESTFILE 2>&1 &
PIDS=`echo $PIDS " " $!`
MPSTAT_LOGFILE=`printf "${RESULTS_DIR}/RdRand.numaRun.%03dstreams.loop%02d.mpstat" $NOSTREAMS $LOOP_CNT`
mpstat -P ALL 2 >& ${MPSTAT_LOGFILE} &
MPSTATPID=$!
wait ${PIDS}
kill ${MPSTATPID}
popd
