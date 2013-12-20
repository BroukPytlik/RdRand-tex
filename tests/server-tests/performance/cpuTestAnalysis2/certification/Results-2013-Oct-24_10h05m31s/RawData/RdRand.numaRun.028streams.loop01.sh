#!/bin/bash -v
date
RESULTS_DIR=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-24_10h05m31s/RawData
NOSTREAMS=28
LOOP_CNT=1
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-24_10h05m31s/RawData/RdRand.numaRun.028streams.loop01.instance001.node000.log
 numactl --cpunodebind=0 --membind=0 /root/RdRand /dev/null -t 1 -d 3 -c 3 ${SEM_ID} > $TESTFILE 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-24_10h05m31s/RawData/RdRand.numaRun.028streams.loop01.instance002.node000.log
 numactl --cpunodebind=0 --membind=0 /root/RdRand /dev/null -t 1 -d 3 -c 3 ${SEM_ID} > $TESTFILE 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-24_10h05m31s/RawData/RdRand.numaRun.028streams.loop01.instance003.node000.log
 numactl --cpunodebind=0 --membind=0 /root/RdRand /dev/null -t 1 -d 3 -c 3 ${SEM_ID} > $TESTFILE 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-24_10h05m31s/RawData/RdRand.numaRun.028streams.loop01.instance004.node000.log
 numactl --cpunodebind=0 --membind=0 /root/RdRand /dev/null -t 1 -d 3 -c 3 ${SEM_ID} > $TESTFILE 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-24_10h05m31s/RawData/RdRand.numaRun.028streams.loop01.instance005.node000.log
 numactl --cpunodebind=0 --membind=0 /root/RdRand /dev/null -t 1 -d 3 -c 3 ${SEM_ID} > $TESTFILE 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-24_10h05m31s/RawData/RdRand.numaRun.028streams.loop01.instance006.node000.log
 numactl --cpunodebind=0 --membind=0 /root/RdRand /dev/null -t 1 -d 3 -c 3 ${SEM_ID} > $TESTFILE 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-24_10h05m31s/RawData/RdRand.numaRun.028streams.loop01.instance007.node000.log
 numactl --cpunodebind=0 --membind=0 /root/RdRand /dev/null -t 1 -d 3 -c 3 ${SEM_ID} > $TESTFILE 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-24_10h05m31s/RawData/RdRand.numaRun.028streams.loop01.instance008.node001.log
 numactl --cpunodebind=1 --membind=1 /root/RdRand /dev/null -t 1 -d 3 -c 3 ${SEM_ID} > $TESTFILE 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-24_10h05m31s/RawData/RdRand.numaRun.028streams.loop01.instance009.node001.log
 numactl --cpunodebind=1 --membind=1 /root/RdRand /dev/null -t 1 -d 3 -c 3 ${SEM_ID} > $TESTFILE 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-24_10h05m31s/RawData/RdRand.numaRun.028streams.loop01.instance010.node001.log
 numactl --cpunodebind=1 --membind=1 /root/RdRand /dev/null -t 1 -d 3 -c 3 ${SEM_ID} > $TESTFILE 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-24_10h05m31s/RawData/RdRand.numaRun.028streams.loop01.instance011.node001.log
 numactl --cpunodebind=1 --membind=1 /root/RdRand /dev/null -t 1 -d 3 -c 3 ${SEM_ID} > $TESTFILE 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-24_10h05m31s/RawData/RdRand.numaRun.028streams.loop01.instance012.node001.log
 numactl --cpunodebind=1 --membind=1 /root/RdRand /dev/null -t 1 -d 3 -c 3 ${SEM_ID} > $TESTFILE 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-24_10h05m31s/RawData/RdRand.numaRun.028streams.loop01.instance013.node001.log
 numactl --cpunodebind=1 --membind=1 /root/RdRand /dev/null -t 1 -d 3 -c 3 ${SEM_ID} > $TESTFILE 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-24_10h05m31s/RawData/RdRand.numaRun.028streams.loop01.instance014.node001.log
 numactl --cpunodebind=1 --membind=1 /root/RdRand /dev/null -t 1 -d 3 -c 3 ${SEM_ID} > $TESTFILE 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-24_10h05m31s/RawData/RdRand.numaRun.028streams.loop01.instance015.node002.log
 numactl --cpunodebind=2 --membind=2 /root/RdRand /dev/null -t 1 -d 3 -c 3 ${SEM_ID} > $TESTFILE 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-24_10h05m31s/RawData/RdRand.numaRun.028streams.loop01.instance016.node002.log
 numactl --cpunodebind=2 --membind=2 /root/RdRand /dev/null -t 1 -d 3 -c 3 ${SEM_ID} > $TESTFILE 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-24_10h05m31s/RawData/RdRand.numaRun.028streams.loop01.instance017.node002.log
 numactl --cpunodebind=2 --membind=2 /root/RdRand /dev/null -t 1 -d 3 -c 3 ${SEM_ID} > $TESTFILE 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-24_10h05m31s/RawData/RdRand.numaRun.028streams.loop01.instance018.node002.log
 numactl --cpunodebind=2 --membind=2 /root/RdRand /dev/null -t 1 -d 3 -c 3 ${SEM_ID} > $TESTFILE 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-24_10h05m31s/RawData/RdRand.numaRun.028streams.loop01.instance019.node002.log
 numactl --cpunodebind=2 --membind=2 /root/RdRand /dev/null -t 1 -d 3 -c 3 ${SEM_ID} > $TESTFILE 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-24_10h05m31s/RawData/RdRand.numaRun.028streams.loop01.instance020.node002.log
 numactl --cpunodebind=2 --membind=2 /root/RdRand /dev/null -t 1 -d 3 -c 3 ${SEM_ID} > $TESTFILE 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-24_10h05m31s/RawData/RdRand.numaRun.028streams.loop01.instance021.node002.log
 numactl --cpunodebind=2 --membind=2 /root/RdRand /dev/null -t 1 -d 3 -c 3 ${SEM_ID} > $TESTFILE 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-24_10h05m31s/RawData/RdRand.numaRun.028streams.loop01.instance022.node003.log
 numactl --cpunodebind=3 --membind=3 /root/RdRand /dev/null -t 1 -d 3 -c 3 ${SEM_ID} > $TESTFILE 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-24_10h05m31s/RawData/RdRand.numaRun.028streams.loop01.instance023.node003.log
 numactl --cpunodebind=3 --membind=3 /root/RdRand /dev/null -t 1 -d 3 -c 3 ${SEM_ID} > $TESTFILE 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-24_10h05m31s/RawData/RdRand.numaRun.028streams.loop01.instance024.node003.log
 numactl --cpunodebind=3 --membind=3 /root/RdRand /dev/null -t 1 -d 3 -c 3 ${SEM_ID} > $TESTFILE 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-24_10h05m31s/RawData/RdRand.numaRun.028streams.loop01.instance025.node003.log
 numactl --cpunodebind=3 --membind=3 /root/RdRand /dev/null -t 1 -d 3 -c 3 ${SEM_ID} > $TESTFILE 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-24_10h05m31s/RawData/RdRand.numaRun.028streams.loop01.instance026.node003.log
 numactl --cpunodebind=3 --membind=3 /root/RdRand /dev/null -t 1 -d 3 -c 3 ${SEM_ID} > $TESTFILE 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-24_10h05m31s/RawData/RdRand.numaRun.028streams.loop01.instance027.node003.log
 numactl --cpunodebind=3 --membind=3 /root/RdRand /dev/null -t 1 -d 3 -c 3 ${SEM_ID} > $TESTFILE 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-24_10h05m31s/RawData/RdRand.numaRun.028streams.loop01.instance028.node003.log
 numactl --cpunodebind=3 --membind=3 /root/RdRand /dev/null -t 1 -d 3 -c 3 ${SEM_ID} > $TESTFILE 2>&1 &
date
wait
