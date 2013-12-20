#!/bin/bash -v
date
RESULTS_DIR=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData
NOSTREAMS=16
LOOP_CNT=1
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.numaRun.016streams.loop01.instance001.node000.log
 numactl --cpunodebind=0 --membind=0 /root/RdRand /dev/null -t 1 ${SEM_ID} > $TESTFILE 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.numaRun.016streams.loop01.instance002.node000.log
 numactl --cpunodebind=0 --membind=0 /root/RdRand /dev/null -t 1 ${SEM_ID} > $TESTFILE 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.numaRun.016streams.loop01.instance003.node000.log
 numactl --cpunodebind=0 --membind=0 /root/RdRand /dev/null -t 1 ${SEM_ID} > $TESTFILE 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.numaRun.016streams.loop01.instance004.node000.log
 numactl --cpunodebind=0 --membind=0 /root/RdRand /dev/null -t 1 ${SEM_ID} > $TESTFILE 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.numaRun.016streams.loop01.instance005.node001.log
 numactl --cpunodebind=1 --membind=1 /root/RdRand /dev/null -t 1 ${SEM_ID} > $TESTFILE 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.numaRun.016streams.loop01.instance006.node001.log
 numactl --cpunodebind=1 --membind=1 /root/RdRand /dev/null -t 1 ${SEM_ID} > $TESTFILE 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.numaRun.016streams.loop01.instance007.node001.log
 numactl --cpunodebind=1 --membind=1 /root/RdRand /dev/null -t 1 ${SEM_ID} > $TESTFILE 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.numaRun.016streams.loop01.instance008.node001.log
 numactl --cpunodebind=1 --membind=1 /root/RdRand /dev/null -t 1 ${SEM_ID} > $TESTFILE 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.numaRun.016streams.loop01.instance009.node002.log
 numactl --cpunodebind=2 --membind=2 /root/RdRand /dev/null -t 1 ${SEM_ID} > $TESTFILE 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.numaRun.016streams.loop01.instance010.node002.log
 numactl --cpunodebind=2 --membind=2 /root/RdRand /dev/null -t 1 ${SEM_ID} > $TESTFILE 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.numaRun.016streams.loop01.instance011.node002.log
 numactl --cpunodebind=2 --membind=2 /root/RdRand /dev/null -t 1 ${SEM_ID} > $TESTFILE 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.numaRun.016streams.loop01.instance012.node002.log
 numactl --cpunodebind=2 --membind=2 /root/RdRand /dev/null -t 1 ${SEM_ID} > $TESTFILE 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.numaRun.016streams.loop01.instance013.node003.log
 numactl --cpunodebind=3 --membind=3 /root/RdRand /dev/null -t 1 ${SEM_ID} > $TESTFILE 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.numaRun.016streams.loop01.instance014.node003.log
 numactl --cpunodebind=3 --membind=3 /root/RdRand /dev/null -t 1 ${SEM_ID} > $TESTFILE 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.numaRun.016streams.loop01.instance015.node003.log
 numactl --cpunodebind=3 --membind=3 /root/RdRand /dev/null -t 1 ${SEM_ID} > $TESTFILE 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.numaRun.016streams.loop01.instance016.node003.log
 numactl --cpunodebind=3 --membind=3 /root/RdRand /dev/null -t 1 ${SEM_ID} > $TESTFILE 2>&1 &
date
wait
