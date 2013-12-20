#!/bin/bash -v
date
RESULTS_DIR=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-24_10h05m31s/RawData
NOSTREAMS=2
LOOP_CNT=1
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-24_10h05m31s/RawData/RdRand.affinityRun.002streams.loop01.instance001.SOCKET00.CORE001.PU01.log
 taskset 0x2 /root/RdRand /dev/null -t 1 -d 3 -c 3 ${SEM_ID} > ${TESTFILE} 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-24_10h05m31s/RawData/RdRand.affinityRun.002streams.loop01.instance002.SOCKET01.CORE000.PU15.log
 taskset 0x8000 /root/RdRand /dev/null -t 1 -d 3 -c 3 ${SEM_ID} > ${TESTFILE} 2>&1 &
date
wait
