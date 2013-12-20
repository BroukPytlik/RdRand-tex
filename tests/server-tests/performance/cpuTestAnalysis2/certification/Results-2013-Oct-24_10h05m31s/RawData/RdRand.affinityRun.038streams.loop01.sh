#!/bin/bash -v
date
RESULTS_DIR=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-24_10h05m31s/RawData
NOSTREAMS=38
LOOP_CNT=1
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-24_10h05m31s/RawData/RdRand.affinityRun.038streams.loop01.instance001.SOCKET00.CORE000.PU60.log
 taskset 0x1000000000000000 /root/RdRand /dev/null -t 1 -d 3 -c 3 ${SEM_ID} > ${TESTFILE} 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-24_10h05m31s/RawData/RdRand.affinityRun.038streams.loop01.instance002.SOCKET00.CORE001.PU01.log
 taskset 0x2 /root/RdRand /dev/null -t 1 -d 3 -c 3 ${SEM_ID} > ${TESTFILE} 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-24_10h05m31s/RawData/RdRand.affinityRun.038streams.loop01.instance003.SOCKET00.CORE002.PU02.log
 taskset 0x4 /root/RdRand /dev/null -t 1 -d 3 -c 3 ${SEM_ID} > ${TESTFILE} 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-24_10h05m31s/RawData/RdRand.affinityRun.038streams.loop01.instance004.SOCKET00.CORE003.PU03.log
 taskset 0x8 /root/RdRand /dev/null -t 1 -d 3 -c 3 ${SEM_ID} > ${TESTFILE} 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-24_10h05m31s/RawData/RdRand.affinityRun.038streams.loop01.instance005.SOCKET00.CORE004.PU04.log
 taskset 0x10 /root/RdRand /dev/null -t 1 -d 3 -c 3 ${SEM_ID} > ${TESTFILE} 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-24_10h05m31s/RawData/RdRand.affinityRun.038streams.loop01.instance006.SOCKET00.CORE005.PU05.log
 taskset 0x20 /root/RdRand /dev/null -t 1 -d 3 -c 3 ${SEM_ID} > ${TESTFILE} 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-24_10h05m31s/RawData/RdRand.affinityRun.038streams.loop01.instance007.SOCKET00.CORE006.PU06.log
 taskset 0x40 /root/RdRand /dev/null -t 1 -d 3 -c 3 ${SEM_ID} > ${TESTFILE} 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-24_10h05m31s/RawData/RdRand.affinityRun.038streams.loop01.instance008.SOCKET00.CORE007.PU07.log
 taskset 0x80 /root/RdRand /dev/null -t 1 -d 3 -c 3 ${SEM_ID} > ${TESTFILE} 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-24_10h05m31s/RawData/RdRand.affinityRun.038streams.loop01.instance009.SOCKET00.CORE008.PU08.log
 taskset 0x100 /root/RdRand /dev/null -t 1 -d 3 -c 3 ${SEM_ID} > ${TESTFILE} 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-24_10h05m31s/RawData/RdRand.affinityRun.038streams.loop01.instance010.SOCKET00.CORE009.PU09.log
 taskset 0x200 /root/RdRand /dev/null -t 1 -d 3 -c 3 ${SEM_ID} > ${TESTFILE} 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-24_10h05m31s/RawData/RdRand.affinityRun.038streams.loop01.instance011.SOCKET01.CORE000.PU15.log
 taskset 0x8000 /root/RdRand /dev/null -t 1 -d 3 -c 3 ${SEM_ID} > ${TESTFILE} 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-24_10h05m31s/RawData/RdRand.affinityRun.038streams.loop01.instance012.SOCKET01.CORE001.PU16.log
 taskset 0x10000 /root/RdRand /dev/null -t 1 -d 3 -c 3 ${SEM_ID} > ${TESTFILE} 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-24_10h05m31s/RawData/RdRand.affinityRun.038streams.loop01.instance013.SOCKET01.CORE002.PU17.log
 taskset 0x20000 /root/RdRand /dev/null -t 1 -d 3 -c 3 ${SEM_ID} > ${TESTFILE} 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-24_10h05m31s/RawData/RdRand.affinityRun.038streams.loop01.instance014.SOCKET01.CORE003.PU18.log
 taskset 0x40000 /root/RdRand /dev/null -t 1 -d 3 -c 3 ${SEM_ID} > ${TESTFILE} 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-24_10h05m31s/RawData/RdRand.affinityRun.038streams.loop01.instance015.SOCKET01.CORE004.PU19.log
 taskset 0x80000 /root/RdRand /dev/null -t 1 -d 3 -c 3 ${SEM_ID} > ${TESTFILE} 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-24_10h05m31s/RawData/RdRand.affinityRun.038streams.loop01.instance016.SOCKET01.CORE005.PU20.log
 taskset 0x100000 /root/RdRand /dev/null -t 1 -d 3 -c 3 ${SEM_ID} > ${TESTFILE} 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-24_10h05m31s/RawData/RdRand.affinityRun.038streams.loop01.instance017.SOCKET01.CORE006.PU21.log
 taskset 0x200000 /root/RdRand /dev/null -t 1 -d 3 -c 3 ${SEM_ID} > ${TESTFILE} 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-24_10h05m31s/RawData/RdRand.affinityRun.038streams.loop01.instance018.SOCKET01.CORE007.PU22.log
 taskset 0x400000 /root/RdRand /dev/null -t 1 -d 3 -c 3 ${SEM_ID} > ${TESTFILE} 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-24_10h05m31s/RawData/RdRand.affinityRun.038streams.loop01.instance019.SOCKET01.CORE008.PU23.log
 taskset 0x800000 /root/RdRand /dev/null -t 1 -d 3 -c 3 ${SEM_ID} > ${TESTFILE} 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-24_10h05m31s/RawData/RdRand.affinityRun.038streams.loop01.instance020.SOCKET01.CORE009.PU24.log
 taskset 0x1000000 /root/RdRand /dev/null -t 1 -d 3 -c 3 ${SEM_ID} > ${TESTFILE} 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-24_10h05m31s/RawData/RdRand.affinityRun.038streams.loop01.instance021.SOCKET02.CORE000.PU30.log
 taskset 0x40000000 /root/RdRand /dev/null -t 1 -d 3 -c 3 ${SEM_ID} > ${TESTFILE} 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-24_10h05m31s/RawData/RdRand.affinityRun.038streams.loop01.instance022.SOCKET02.CORE001.PU31.log
 taskset 0x80000000 /root/RdRand /dev/null -t 1 -d 3 -c 3 ${SEM_ID} > ${TESTFILE} 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-24_10h05m31s/RawData/RdRand.affinityRun.038streams.loop01.instance023.SOCKET02.CORE002.PU32.log
 taskset 0x100000000 /root/RdRand /dev/null -t 1 -d 3 -c 3 ${SEM_ID} > ${TESTFILE} 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-24_10h05m31s/RawData/RdRand.affinityRun.038streams.loop01.instance024.SOCKET02.CORE003.PU33.log
 taskset 0x200000000 /root/RdRand /dev/null -t 1 -d 3 -c 3 ${SEM_ID} > ${TESTFILE} 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-24_10h05m31s/RawData/RdRand.affinityRun.038streams.loop01.instance025.SOCKET02.CORE004.PU34.log
 taskset 0x400000000 /root/RdRand /dev/null -t 1 -d 3 -c 3 ${SEM_ID} > ${TESTFILE} 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-24_10h05m31s/RawData/RdRand.affinityRun.038streams.loop01.instance026.SOCKET02.CORE005.PU35.log
 taskset 0x800000000 /root/RdRand /dev/null -t 1 -d 3 -c 3 ${SEM_ID} > ${TESTFILE} 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-24_10h05m31s/RawData/RdRand.affinityRun.038streams.loop01.instance027.SOCKET02.CORE006.PU36.log
 taskset 0x1000000000 /root/RdRand /dev/null -t 1 -d 3 -c 3 ${SEM_ID} > ${TESTFILE} 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-24_10h05m31s/RawData/RdRand.affinityRun.038streams.loop01.instance028.SOCKET02.CORE007.PU37.log
 taskset 0x2000000000 /root/RdRand /dev/null -t 1 -d 3 -c 3 ${SEM_ID} > ${TESTFILE} 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-24_10h05m31s/RawData/RdRand.affinityRun.038streams.loop01.instance029.SOCKET02.CORE008.PU38.log
 taskset 0x4000000000 /root/RdRand /dev/null -t 1 -d 3 -c 3 ${SEM_ID} > ${TESTFILE} 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-24_10h05m31s/RawData/RdRand.affinityRun.038streams.loop01.instance030.SOCKET03.CORE000.PU45.log
 taskset 0x200000000000 /root/RdRand /dev/null -t 1 -d 3 -c 3 ${SEM_ID} > ${TESTFILE} 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-24_10h05m31s/RawData/RdRand.affinityRun.038streams.loop01.instance031.SOCKET03.CORE001.PU46.log
 taskset 0x400000000000 /root/RdRand /dev/null -t 1 -d 3 -c 3 ${SEM_ID} > ${TESTFILE} 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-24_10h05m31s/RawData/RdRand.affinityRun.038streams.loop01.instance032.SOCKET03.CORE002.PU47.log
 taskset 0x800000000000 /root/RdRand /dev/null -t 1 -d 3 -c 3 ${SEM_ID} > ${TESTFILE} 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-24_10h05m31s/RawData/RdRand.affinityRun.038streams.loop01.instance033.SOCKET03.CORE003.PU48.log
 taskset 0x1000000000000 /root/RdRand /dev/null -t 1 -d 3 -c 3 ${SEM_ID} > ${TESTFILE} 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-24_10h05m31s/RawData/RdRand.affinityRun.038streams.loop01.instance034.SOCKET03.CORE004.PU49.log
 taskset 0x2000000000000 /root/RdRand /dev/null -t 1 -d 3 -c 3 ${SEM_ID} > ${TESTFILE} 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-24_10h05m31s/RawData/RdRand.affinityRun.038streams.loop01.instance035.SOCKET03.CORE005.PU50.log
 taskset 0x4000000000000 /root/RdRand /dev/null -t 1 -d 3 -c 3 ${SEM_ID} > ${TESTFILE} 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-24_10h05m31s/RawData/RdRand.affinityRun.038streams.loop01.instance036.SOCKET03.CORE006.PU51.log
 taskset 0x8000000000000 /root/RdRand /dev/null -t 1 -d 3 -c 3 ${SEM_ID} > ${TESTFILE} 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-24_10h05m31s/RawData/RdRand.affinityRun.038streams.loop01.instance037.SOCKET03.CORE007.PU52.log
 taskset 0x10000000000000 /root/RdRand /dev/null -t 1 -d 3 -c 3 ${SEM_ID} > ${TESTFILE} 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-24_10h05m31s/RawData/RdRand.affinityRun.038streams.loop01.instance038.SOCKET03.CORE008.PU53.log
 taskset 0x20000000000000 /root/RdRand /dev/null -t 1 -d 3 -c 3 ${SEM_ID} > ${TESTFILE} 2>&1 &
date
wait
