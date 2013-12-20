#!/bin/bash -v
date
RESULTS_DIR=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData
NOSTREAMS=10
LOOP_CNT=1
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.affinityRun.010streams.loop01.instance001.SOCKET00.CORE000.PU60.log
 taskset 0x1000000000000000 /root/RdRand /dev/null -t 1 ${SEM_ID} > ${TESTFILE} 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.affinityRun.010streams.loop01.instance002.SOCKET00.CORE001.PU01.log
 taskset 0x2 /root/RdRand /dev/null -t 1 ${SEM_ID} > ${TESTFILE} 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.affinityRun.010streams.loop01.instance003.SOCKET00.CORE002.PU02.log
 taskset 0x4 /root/RdRand /dev/null -t 1 ${SEM_ID} > ${TESTFILE} 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.affinityRun.010streams.loop01.instance004.SOCKET01.CORE000.PU15.log
 taskset 0x8000 /root/RdRand /dev/null -t 1 ${SEM_ID} > ${TESTFILE} 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.affinityRun.010streams.loop01.instance005.SOCKET01.CORE001.PU16.log
 taskset 0x10000 /root/RdRand /dev/null -t 1 ${SEM_ID} > ${TESTFILE} 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.affinityRun.010streams.loop01.instance006.SOCKET01.CORE002.PU17.log
 taskset 0x20000 /root/RdRand /dev/null -t 1 ${SEM_ID} > ${TESTFILE} 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.affinityRun.010streams.loop01.instance007.SOCKET02.CORE000.PU30.log
 taskset 0x40000000 /root/RdRand /dev/null -t 1 ${SEM_ID} > ${TESTFILE} 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.affinityRun.010streams.loop01.instance008.SOCKET02.CORE001.PU31.log
 taskset 0x80000000 /root/RdRand /dev/null -t 1 ${SEM_ID} > ${TESTFILE} 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.affinityRun.010streams.loop01.instance009.SOCKET03.CORE000.PU45.log
 taskset 0x200000000000 /root/RdRand /dev/null -t 1 ${SEM_ID} > ${TESTFILE} 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.affinityRun.010streams.loop01.instance010.SOCKET03.CORE001.PU46.log
 taskset 0x400000000000 /root/RdRand /dev/null -t 1 ${SEM_ID} > ${TESTFILE} 2>&1 &
date
wait