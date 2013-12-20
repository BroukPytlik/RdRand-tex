#!/bin/bash -v
date
RESULTS_DIR=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData
NOSTREAMS=1
LOOP_CNT=1
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.numaRun.001streams.loop01.instance001.node000.log
 numactl --cpunodebind=0 --membind=0 /root/RdRand /dev/null -t 1 ${SEM_ID} > $TESTFILE 2>&1 &
date
wait
