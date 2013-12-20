#!/bin/bash -v
date
RESULTS_DIR=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData
NOSTREAMS=64
LOOP_CNT=1
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.numaRun.064streams.loop01.instance001.node000.log
 numactl --cpunodebind=0 --membind=0 /root/RdRand /dev/null -t 1 ${SEM_ID} > $TESTFILE 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.numaRun.064streams.loop01.instance002.node000.log
 numactl --cpunodebind=0 --membind=0 /root/RdRand /dev/null -t 1 ${SEM_ID} > $TESTFILE 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.numaRun.064streams.loop01.instance003.node000.log
 numactl --cpunodebind=0 --membind=0 /root/RdRand /dev/null -t 1 ${SEM_ID} > $TESTFILE 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.numaRun.064streams.loop01.instance004.node000.log
 numactl --cpunodebind=0 --membind=0 /root/RdRand /dev/null -t 1 ${SEM_ID} > $TESTFILE 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.numaRun.064streams.loop01.instance005.node000.log
 numactl --cpunodebind=0 --membind=0 /root/RdRand /dev/null -t 1 ${SEM_ID} > $TESTFILE 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.numaRun.064streams.loop01.instance006.node000.log
 numactl --cpunodebind=0 --membind=0 /root/RdRand /dev/null -t 1 ${SEM_ID} > $TESTFILE 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.numaRun.064streams.loop01.instance007.node000.log
 numactl --cpunodebind=0 --membind=0 /root/RdRand /dev/null -t 1 ${SEM_ID} > $TESTFILE 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.numaRun.064streams.loop01.instance008.node000.log
 numactl --cpunodebind=0 --membind=0 /root/RdRand /dev/null -t 1 ${SEM_ID} > $TESTFILE 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.numaRun.064streams.loop01.instance009.node000.log
 numactl --cpunodebind=0 --membind=0 /root/RdRand /dev/null -t 1 ${SEM_ID} > $TESTFILE 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.numaRun.064streams.loop01.instance010.node000.log
 numactl --cpunodebind=0 --membind=0 /root/RdRand /dev/null -t 1 ${SEM_ID} > $TESTFILE 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.numaRun.064streams.loop01.instance011.node000.log
 numactl --cpunodebind=0 --membind=0 /root/RdRand /dev/null -t 1 ${SEM_ID} > $TESTFILE 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.numaRun.064streams.loop01.instance012.node000.log
 numactl --cpunodebind=0 --membind=0 /root/RdRand /dev/null -t 1 ${SEM_ID} > $TESTFILE 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.numaRun.064streams.loop01.instance013.node000.log
 numactl --cpunodebind=0 --membind=0 /root/RdRand /dev/null -t 1 ${SEM_ID} > $TESTFILE 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.numaRun.064streams.loop01.instance014.node000.log
 numactl --cpunodebind=0 --membind=0 /root/RdRand /dev/null -t 1 ${SEM_ID} > $TESTFILE 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.numaRun.064streams.loop01.instance015.node000.log
 numactl --cpunodebind=0 --membind=0 /root/RdRand /dev/null -t 1 ${SEM_ID} > $TESTFILE 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.numaRun.064streams.loop01.instance016.node000.log
 numactl --cpunodebind=0 --membind=0 /root/RdRand /dev/null -t 1 ${SEM_ID} > $TESTFILE 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.numaRun.064streams.loop01.instance017.node001.log
 numactl --cpunodebind=1 --membind=1 /root/RdRand /dev/null -t 1 ${SEM_ID} > $TESTFILE 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.numaRun.064streams.loop01.instance018.node001.log
 numactl --cpunodebind=1 --membind=1 /root/RdRand /dev/null -t 1 ${SEM_ID} > $TESTFILE 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.numaRun.064streams.loop01.instance019.node001.log
 numactl --cpunodebind=1 --membind=1 /root/RdRand /dev/null -t 1 ${SEM_ID} > $TESTFILE 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.numaRun.064streams.loop01.instance020.node001.log
 numactl --cpunodebind=1 --membind=1 /root/RdRand /dev/null -t 1 ${SEM_ID} > $TESTFILE 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.numaRun.064streams.loop01.instance021.node001.log
 numactl --cpunodebind=1 --membind=1 /root/RdRand /dev/null -t 1 ${SEM_ID} > $TESTFILE 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.numaRun.064streams.loop01.instance022.node001.log
 numactl --cpunodebind=1 --membind=1 /root/RdRand /dev/null -t 1 ${SEM_ID} > $TESTFILE 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.numaRun.064streams.loop01.instance023.node001.log
 numactl --cpunodebind=1 --membind=1 /root/RdRand /dev/null -t 1 ${SEM_ID} > $TESTFILE 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.numaRun.064streams.loop01.instance024.node001.log
 numactl --cpunodebind=1 --membind=1 /root/RdRand /dev/null -t 1 ${SEM_ID} > $TESTFILE 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.numaRun.064streams.loop01.instance025.node001.log
 numactl --cpunodebind=1 --membind=1 /root/RdRand /dev/null -t 1 ${SEM_ID} > $TESTFILE 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.numaRun.064streams.loop01.instance026.node001.log
 numactl --cpunodebind=1 --membind=1 /root/RdRand /dev/null -t 1 ${SEM_ID} > $TESTFILE 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.numaRun.064streams.loop01.instance027.node001.log
 numactl --cpunodebind=1 --membind=1 /root/RdRand /dev/null -t 1 ${SEM_ID} > $TESTFILE 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.numaRun.064streams.loop01.instance028.node001.log
 numactl --cpunodebind=1 --membind=1 /root/RdRand /dev/null -t 1 ${SEM_ID} > $TESTFILE 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.numaRun.064streams.loop01.instance029.node001.log
 numactl --cpunodebind=1 --membind=1 /root/RdRand /dev/null -t 1 ${SEM_ID} > $TESTFILE 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.numaRun.064streams.loop01.instance030.node001.log
 numactl --cpunodebind=1 --membind=1 /root/RdRand /dev/null -t 1 ${SEM_ID} > $TESTFILE 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.numaRun.064streams.loop01.instance031.node001.log
 numactl --cpunodebind=1 --membind=1 /root/RdRand /dev/null -t 1 ${SEM_ID} > $TESTFILE 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.numaRun.064streams.loop01.instance032.node001.log
 numactl --cpunodebind=1 --membind=1 /root/RdRand /dev/null -t 1 ${SEM_ID} > $TESTFILE 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.numaRun.064streams.loop01.instance033.node002.log
 numactl --cpunodebind=2 --membind=2 /root/RdRand /dev/null -t 1 ${SEM_ID} > $TESTFILE 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.numaRun.064streams.loop01.instance034.node002.log
 numactl --cpunodebind=2 --membind=2 /root/RdRand /dev/null -t 1 ${SEM_ID} > $TESTFILE 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.numaRun.064streams.loop01.instance035.node002.log
 numactl --cpunodebind=2 --membind=2 /root/RdRand /dev/null -t 1 ${SEM_ID} > $TESTFILE 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.numaRun.064streams.loop01.instance036.node002.log
 numactl --cpunodebind=2 --membind=2 /root/RdRand /dev/null -t 1 ${SEM_ID} > $TESTFILE 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.numaRun.064streams.loop01.instance037.node002.log
 numactl --cpunodebind=2 --membind=2 /root/RdRand /dev/null -t 1 ${SEM_ID} > $TESTFILE 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.numaRun.064streams.loop01.instance038.node002.log
 numactl --cpunodebind=2 --membind=2 /root/RdRand /dev/null -t 1 ${SEM_ID} > $TESTFILE 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.numaRun.064streams.loop01.instance039.node002.log
 numactl --cpunodebind=2 --membind=2 /root/RdRand /dev/null -t 1 ${SEM_ID} > $TESTFILE 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.numaRun.064streams.loop01.instance040.node002.log
 numactl --cpunodebind=2 --membind=2 /root/RdRand /dev/null -t 1 ${SEM_ID} > $TESTFILE 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.numaRun.064streams.loop01.instance041.node002.log
 numactl --cpunodebind=2 --membind=2 /root/RdRand /dev/null -t 1 ${SEM_ID} > $TESTFILE 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.numaRun.064streams.loop01.instance042.node002.log
 numactl --cpunodebind=2 --membind=2 /root/RdRand /dev/null -t 1 ${SEM_ID} > $TESTFILE 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.numaRun.064streams.loop01.instance043.node002.log
 numactl --cpunodebind=2 --membind=2 /root/RdRand /dev/null -t 1 ${SEM_ID} > $TESTFILE 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.numaRun.064streams.loop01.instance044.node002.log
 numactl --cpunodebind=2 --membind=2 /root/RdRand /dev/null -t 1 ${SEM_ID} > $TESTFILE 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.numaRun.064streams.loop01.instance045.node002.log
 numactl --cpunodebind=2 --membind=2 /root/RdRand /dev/null -t 1 ${SEM_ID} > $TESTFILE 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.numaRun.064streams.loop01.instance046.node002.log
 numactl --cpunodebind=2 --membind=2 /root/RdRand /dev/null -t 1 ${SEM_ID} > $TESTFILE 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.numaRun.064streams.loop01.instance047.node002.log
 numactl --cpunodebind=2 --membind=2 /root/RdRand /dev/null -t 1 ${SEM_ID} > $TESTFILE 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.numaRun.064streams.loop01.instance048.node002.log
 numactl --cpunodebind=2 --membind=2 /root/RdRand /dev/null -t 1 ${SEM_ID} > $TESTFILE 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.numaRun.064streams.loop01.instance049.node003.log
 numactl --cpunodebind=3 --membind=3 /root/RdRand /dev/null -t 1 ${SEM_ID} > $TESTFILE 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.numaRun.064streams.loop01.instance050.node003.log
 numactl --cpunodebind=3 --membind=3 /root/RdRand /dev/null -t 1 ${SEM_ID} > $TESTFILE 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.numaRun.064streams.loop01.instance051.node003.log
 numactl --cpunodebind=3 --membind=3 /root/RdRand /dev/null -t 1 ${SEM_ID} > $TESTFILE 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.numaRun.064streams.loop01.instance052.node003.log
 numactl --cpunodebind=3 --membind=3 /root/RdRand /dev/null -t 1 ${SEM_ID} > $TESTFILE 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.numaRun.064streams.loop01.instance053.node003.log
 numactl --cpunodebind=3 --membind=3 /root/RdRand /dev/null -t 1 ${SEM_ID} > $TESTFILE 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.numaRun.064streams.loop01.instance054.node003.log
 numactl --cpunodebind=3 --membind=3 /root/RdRand /dev/null -t 1 ${SEM_ID} > $TESTFILE 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.numaRun.064streams.loop01.instance055.node003.log
 numactl --cpunodebind=3 --membind=3 /root/RdRand /dev/null -t 1 ${SEM_ID} > $TESTFILE 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.numaRun.064streams.loop01.instance056.node003.log
 numactl --cpunodebind=3 --membind=3 /root/RdRand /dev/null -t 1 ${SEM_ID} > $TESTFILE 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.numaRun.064streams.loop01.instance057.node003.log
 numactl --cpunodebind=3 --membind=3 /root/RdRand /dev/null -t 1 ${SEM_ID} > $TESTFILE 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.numaRun.064streams.loop01.instance058.node003.log
 numactl --cpunodebind=3 --membind=3 /root/RdRand /dev/null -t 1 ${SEM_ID} > $TESTFILE 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.numaRun.064streams.loop01.instance059.node003.log
 numactl --cpunodebind=3 --membind=3 /root/RdRand /dev/null -t 1 ${SEM_ID} > $TESTFILE 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.numaRun.064streams.loop01.instance060.node003.log
 numactl --cpunodebind=3 --membind=3 /root/RdRand /dev/null -t 1 ${SEM_ID} > $TESTFILE 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.numaRun.064streams.loop01.instance061.node003.log
 numactl --cpunodebind=3 --membind=3 /root/RdRand /dev/null -t 1 ${SEM_ID} > $TESTFILE 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.numaRun.064streams.loop01.instance062.node003.log
 numactl --cpunodebind=3 --membind=3 /root/RdRand /dev/null -t 1 ${SEM_ID} > $TESTFILE 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.numaRun.064streams.loop01.instance063.node003.log
 numactl --cpunodebind=3 --membind=3 /root/RdRand /dev/null -t 1 ${SEM_ID} > $TESTFILE 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.numaRun.064streams.loop01.instance064.node003.log
 numactl --cpunodebind=3 --membind=3 /root/RdRand /dev/null -t 1 ${SEM_ID} > $TESTFILE 2>&1 &
date
wait
