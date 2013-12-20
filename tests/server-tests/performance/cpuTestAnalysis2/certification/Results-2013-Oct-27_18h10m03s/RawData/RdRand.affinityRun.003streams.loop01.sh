#!/bin/bash -v
date
RESULTS_DIR=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData
NOSTREAMS=3
LOOP_CNT=1
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.affinityRun.003streams.loop01.instance001.SOCKET00.CORE001.PU01.log
 taskset 0x2 /root/RdRand /dev/null -t 1 ${SEM_ID} > ${TESTFILE} 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.affinityRun.003streams.loop01.instance002.SOCKET01.CORE000.PU15.log
 taskset 0x8000 /root/RdRand /dev/null -t 1 ${SEM_ID} > ${TESTFILE} 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.affinityRun.003streams.loop01.instance003.SOCKET02.CORE000.PU30.log
 taskset 0x40000000 /root/RdRand /dev/null -t 1 ${SEM_ID} > ${TESTFILE} 2>&1 &
date
wait
