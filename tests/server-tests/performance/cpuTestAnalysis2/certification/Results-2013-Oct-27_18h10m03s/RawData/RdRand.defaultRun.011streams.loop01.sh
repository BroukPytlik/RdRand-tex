#!/bin/bash -v
date
RESULTS_DIR=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData
NOSTREAMS=11
LOOP_CNT=1
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.defaultRun.011streams.loop01.instance001.log
 /root/RdRand /dev/null -t 1 ${SEM_ID} > ${TESTFILE} 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.defaultRun.011streams.loop01.instance002.log
 /root/RdRand /dev/null -t 1 ${SEM_ID} > ${TESTFILE} 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.defaultRun.011streams.loop01.instance003.log
 /root/RdRand /dev/null -t 1 ${SEM_ID} > ${TESTFILE} 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.defaultRun.011streams.loop01.instance004.log
 /root/RdRand /dev/null -t 1 ${SEM_ID} > ${TESTFILE} 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.defaultRun.011streams.loop01.instance005.log
 /root/RdRand /dev/null -t 1 ${SEM_ID} > ${TESTFILE} 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.defaultRun.011streams.loop01.instance006.log
 /root/RdRand /dev/null -t 1 ${SEM_ID} > ${TESTFILE} 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.defaultRun.011streams.loop01.instance007.log
 /root/RdRand /dev/null -t 1 ${SEM_ID} > ${TESTFILE} 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.defaultRun.011streams.loop01.instance008.log
 /root/RdRand /dev/null -t 1 ${SEM_ID} > ${TESTFILE} 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.defaultRun.011streams.loop01.instance009.log
 /root/RdRand /dev/null -t 1 ${SEM_ID} > ${TESTFILE} 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.defaultRun.011streams.loop01.instance010.log
 /root/RdRand /dev/null -t 1 ${SEM_ID} > ${TESTFILE} 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.defaultRun.011streams.loop01.instance011.log
 /root/RdRand /dev/null -t 1 ${SEM_ID} > ${TESTFILE} 2>&1 &
date
wait
