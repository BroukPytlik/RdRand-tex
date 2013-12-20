#!/bin/bash -v
date
RESULTS_DIR=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-24_10h05m31s/RawData
NOSTREAMS=11
LOOP_CNT=1
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-24_10h05m31s/RawData/RdRand.affinityRun.011streams.loop01.instance001.SOCKET00.CORE000.PU60.log
 taskset 0x1000000000000000 /root/RdRand /dev/null -t 1 -d 3 -c 3 ${SEM_ID} > ${TESTFILE} 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-24_10h05m31s/RawData/RdRand.affinityRun.011streams.loop01.instance002.SOCKET00.CORE001.PU01.log
 taskset 0x2 /root/RdRand /dev/null -t 1 -d 3 -c 3 ${SEM_ID} > ${TESTFILE} 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-24_10h05m31s/RawData/RdRand.affinityRun.011streams.loop01.instance003.SOCKET00.CORE002.PU02.log
 taskset 0x4 /root/RdRand /dev/null -t 1 -d 3 -c 3 ${SEM_ID} > ${TESTFILE} 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-24_10h05m31s/RawData/RdRand.affinityRun.011streams.loop01.instance004.SOCKET01.CORE000.PU15.log
 taskset 0x8000 /root/RdRand /dev/null -t 1 -d 3 -c 3 ${SEM_ID} > ${TESTFILE} 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-24_10h05m31s/RawData/RdRand.affinityRun.011streams.loop01.instance005.SOCKET01.CORE001.PU16.log
 taskset 0x10000 /root/RdRand /dev/null -t 1 -d 3 -c 3 ${SEM_ID} > ${TESTFILE} 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-24_10h05m31s/RawData/RdRand.affinityRun.011streams.loop01.instance006.SOCKET01.CORE002.PU17.log
 taskset 0x20000 /root/RdRand /dev/null -t 1 -d 3 -c 3 ${SEM_ID} > ${TESTFILE} 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-24_10h05m31s/RawData/RdRand.affinityRun.011streams.loop01.instance007.SOCKET02.CORE000.PU30.log
 taskset 0x40000000 /root/RdRand /dev/null -t 1 -d 3 -c 3 ${SEM_ID} > ${TESTFILE} 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-24_10h05m31s/RawData/RdRand.affinityRun.011streams.loop01.instance008.SOCKET02.CORE001.PU31.log
 taskset 0x80000000 /root/RdRand /dev/null -t 1 -d 3 -c 3 ${SEM_ID} > ${TESTFILE} 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-24_10h05m31s/RawData/RdRand.affinityRun.011streams.loop01.instance009.SOCKET02.CORE002.PU32.log
 taskset 0x100000000 /root/RdRand /dev/null -t 1 -d 3 -c 3 ${SEM_ID} > ${TESTFILE} 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-24_10h05m31s/RawData/RdRand.affinityRun.011streams.loop01.instance010.SOCKET03.CORE000.PU45.log
 taskset 0x200000000000 /root/RdRand /dev/null -t 1 -d 3 -c 3 ${SEM_ID} > ${TESTFILE} 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-24_10h05m31s/RawData/RdRand.affinityRun.011streams.loop01.instance011.SOCKET03.CORE001.PU46.log
 taskset 0x400000000000 /root/RdRand /dev/null -t 1 -d 3 -c 3 ${SEM_ID} > ${TESTFILE} 2>&1 &
date
wait
