#!/bin/bash -v
RESULTS_DIR=`pwd`
pushd ../..
NOSTREAMS=9
LOOP_CNT=1
CNT=1
TESTFILE=`printf "${RESULTS_DIR}/RdRand.defaultRun.%03dstreams.loop%02d.instance%03d.log" $NOSTREAMS $LOOP_CNT $CNT`
 /root/RdRand /dev/null -t 1 -d 3 -c 3 ${SEM_ID} > ${TESTFILE} 2>&1 &
PIDS=`echo $PIDS " " $!`
CNT=2
TESTFILE=`printf "${RESULTS_DIR}/RdRand.defaultRun.%03dstreams.loop%02d.instance%03d.log" $NOSTREAMS $LOOP_CNT $CNT`
 /root/RdRand /dev/null -t 1 -d 3 -c 3 ${SEM_ID} > ${TESTFILE} 2>&1 &
PIDS=`echo $PIDS " " $!`
CNT=3
TESTFILE=`printf "${RESULTS_DIR}/RdRand.defaultRun.%03dstreams.loop%02d.instance%03d.log" $NOSTREAMS $LOOP_CNT $CNT`
 /root/RdRand /dev/null -t 1 -d 3 -c 3 ${SEM_ID} > ${TESTFILE} 2>&1 &
PIDS=`echo $PIDS " " $!`
CNT=4
TESTFILE=`printf "${RESULTS_DIR}/RdRand.defaultRun.%03dstreams.loop%02d.instance%03d.log" $NOSTREAMS $LOOP_CNT $CNT`
 /root/RdRand /dev/null -t 1 -d 3 -c 3 ${SEM_ID} > ${TESTFILE} 2>&1 &
PIDS=`echo $PIDS " " $!`
CNT=5
TESTFILE=`printf "${RESULTS_DIR}/RdRand.defaultRun.%03dstreams.loop%02d.instance%03d.log" $NOSTREAMS $LOOP_CNT $CNT`
 /root/RdRand /dev/null -t 1 -d 3 -c 3 ${SEM_ID} > ${TESTFILE} 2>&1 &
PIDS=`echo $PIDS " " $!`
CNT=6
TESTFILE=`printf "${RESULTS_DIR}/RdRand.defaultRun.%03dstreams.loop%02d.instance%03d.log" $NOSTREAMS $LOOP_CNT $CNT`
 /root/RdRand /dev/null -t 1 -d 3 -c 3 ${SEM_ID} > ${TESTFILE} 2>&1 &
PIDS=`echo $PIDS " " $!`
CNT=7
TESTFILE=`printf "${RESULTS_DIR}/RdRand.defaultRun.%03dstreams.loop%02d.instance%03d.log" $NOSTREAMS $LOOP_CNT $CNT`
 /root/RdRand /dev/null -t 1 -d 3 -c 3 ${SEM_ID} > ${TESTFILE} 2>&1 &
PIDS=`echo $PIDS " " $!`
CNT=8
TESTFILE=`printf "${RESULTS_DIR}/RdRand.defaultRun.%03dstreams.loop%02d.instance%03d.log" $NOSTREAMS $LOOP_CNT $CNT`
 /root/RdRand /dev/null -t 1 -d 3 -c 3 ${SEM_ID} > ${TESTFILE} 2>&1 &
PIDS=`echo $PIDS " " $!`
CNT=9
TESTFILE=`printf "${RESULTS_DIR}/RdRand.defaultRun.%03dstreams.loop%02d.instance%03d.log" $NOSTREAMS $LOOP_CNT $CNT`
 /root/RdRand /dev/null -t 1 -d 3 -c 3 ${SEM_ID} > ${TESTFILE} 2>&1 &
PIDS=`echo $PIDS " " $!`
MPSTAT_LOGFILE=`printf "${RESULTS_DIR}/RdRand.defaultRun.%03dstreams.loop%02d.mpstat" $NOSTREAMS $LOOP_CNT`
mpstat -P ALL 2 >& ${MPSTAT_LOGFILE} &
MPSTATPID=$!
wait ${PIDS}
kill ${MPSTATPID}
popd
