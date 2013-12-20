#!/bin/bash -v
date
RESULTS_DIR=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-24_10h05m31s/RawData
NOSTREAMS=2
LOOP_CNT=1
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-24_10h05m31s/RawData/RdRand.numaRun.002streams.loop01.instance001.node000.log
 numactl --cpunodebind=0 --membind=0 /root/RdRand /dev/null -t 1 -d 3 -c 3 ${SEM_ID} > $TESTFILE 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-24_10h05m31s/RawData/RdRand.numaRun.002streams.loop01.instance002.node001.log
 numactl --cpunodebind=1 --membind=1 /root/RdRand /dev/null -t 1 -d 3 -c 3 ${SEM_ID} > $TESTFILE 2>&1 &
date
wait
