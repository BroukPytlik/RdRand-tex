#!/bin/bash -v
RESULTS_DIR=`pwd`
pushd ../..
NOSTREAMS=9
LOOP_CNT=1
CNT=1
TESTFILE=`printf "${RESULTS_DIR}/RdRand.affinityRun.%03dstreams.loop%02d.instance%03d.SOCKET%02d.CORE%03d.PU%02d.log" $NOSTREAMS $LOOP_CNT $CNT 0 0 60`
 taskset 0x1000000000000000 /root/RdRand /dev/null -t 1 -d 3 -c 3 ${SEM_ID} > ${TESTFILE} 2>&1 &
PIDS=`echo $PIDS " " $!`
CNT=2
TESTFILE=`printf "${RESULTS_DIR}/RdRand.affinityRun.%03dstreams.loop%02d.instance%03d.SOCKET%02d.CORE%03d.PU%02d.log" $NOSTREAMS $LOOP_CNT $CNT 0 1 1`
 taskset 0x2 /root/RdRand /dev/null -t 1 -d 3 -c 3 ${SEM_ID} > ${TESTFILE} 2>&1 &
PIDS=`echo $PIDS " " $!`
CNT=3
TESTFILE=`printf "${RESULTS_DIR}/RdRand.affinityRun.%03dstreams.loop%02d.instance%03d.SOCKET%02d.CORE%03d.PU%02d.log" $NOSTREAMS $LOOP_CNT $CNT 0 2 2`
 taskset 0x4 /root/RdRand /dev/null -t 1 -d 3 -c 3 ${SEM_ID} > ${TESTFILE} 2>&1 &
PIDS=`echo $PIDS " " $!`
CNT=4
TESTFILE=`printf "${RESULTS_DIR}/RdRand.affinityRun.%03dstreams.loop%02d.instance%03d.SOCKET%02d.CORE%03d.PU%02d.log" $NOSTREAMS $LOOP_CNT $CNT 1 0 15`
 taskset 0x8000 /root/RdRand /dev/null -t 1 -d 3 -c 3 ${SEM_ID} > ${TESTFILE} 2>&1 &
PIDS=`echo $PIDS " " $!`
CNT=5
TESTFILE=`printf "${RESULTS_DIR}/RdRand.affinityRun.%03dstreams.loop%02d.instance%03d.SOCKET%02d.CORE%03d.PU%02d.log" $NOSTREAMS $LOOP_CNT $CNT 1 1 16`
 taskset 0x10000 /root/RdRand /dev/null -t 1 -d 3 -c 3 ${SEM_ID} > ${TESTFILE} 2>&1 &
PIDS=`echo $PIDS " " $!`
CNT=6
TESTFILE=`printf "${RESULTS_DIR}/RdRand.affinityRun.%03dstreams.loop%02d.instance%03d.SOCKET%02d.CORE%03d.PU%02d.log" $NOSTREAMS $LOOP_CNT $CNT 2 0 30`
 taskset 0x40000000 /root/RdRand /dev/null -t 1 -d 3 -c 3 ${SEM_ID} > ${TESTFILE} 2>&1 &
PIDS=`echo $PIDS " " $!`
CNT=7
TESTFILE=`printf "${RESULTS_DIR}/RdRand.affinityRun.%03dstreams.loop%02d.instance%03d.SOCKET%02d.CORE%03d.PU%02d.log" $NOSTREAMS $LOOP_CNT $CNT 2 1 31`
 taskset 0x80000000 /root/RdRand /dev/null -t 1 -d 3 -c 3 ${SEM_ID} > ${TESTFILE} 2>&1 &
PIDS=`echo $PIDS " " $!`
CNT=8
TESTFILE=`printf "${RESULTS_DIR}/RdRand.affinityRun.%03dstreams.loop%02d.instance%03d.SOCKET%02d.CORE%03d.PU%02d.log" $NOSTREAMS $LOOP_CNT $CNT 3 0 45`
 taskset 0x200000000000 /root/RdRand /dev/null -t 1 -d 3 -c 3 ${SEM_ID} > ${TESTFILE} 2>&1 &
PIDS=`echo $PIDS " " $!`
CNT=9
TESTFILE=`printf "${RESULTS_DIR}/RdRand.affinityRun.%03dstreams.loop%02d.instance%03d.SOCKET%02d.CORE%03d.PU%02d.log" $NOSTREAMS $LOOP_CNT $CNT 3 1 46`
 taskset 0x400000000000 /root/RdRand /dev/null -t 1 -d 3 -c 3 ${SEM_ID} > ${TESTFILE} 2>&1 &
PIDS=`echo $PIDS " " $!`
MPSTAT_LOGFILE=`printf "${RESULTS_DIR}/RdRand.affinityRun.%03dstreams.loop%02d.mpstat" $NOSTREAMS $LOOP_CNT`
mpstat -P ALL 2 >& ${MPSTAT_LOGFILE} &
MPSTATPID=$!
wait ${PIDS}
kill ${MPSTATPID}
popd
