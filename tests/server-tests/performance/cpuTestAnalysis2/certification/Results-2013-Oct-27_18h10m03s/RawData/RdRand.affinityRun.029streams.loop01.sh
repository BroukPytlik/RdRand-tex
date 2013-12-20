#!/bin/bash -v
date
RESULTS_DIR=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData
NOSTREAMS=29
LOOP_CNT=1
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.affinityRun.029streams.loop01.instance001.SOCKET00.CORE000.PU60.log
 taskset 0x1000000000000000 /root/RdRand /dev/null -t 1 ${SEM_ID} > ${TESTFILE} 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.affinityRun.029streams.loop01.instance002.SOCKET00.CORE001.PU01.log
 taskset 0x2 /root/RdRand /dev/null -t 1 ${SEM_ID} > ${TESTFILE} 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.affinityRun.029streams.loop01.instance003.SOCKET00.CORE002.PU02.log
 taskset 0x4 /root/RdRand /dev/null -t 1 ${SEM_ID} > ${TESTFILE} 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.affinityRun.029streams.loop01.instance004.SOCKET00.CORE003.PU03.log
 taskset 0x8 /root/RdRand /dev/null -t 1 ${SEM_ID} > ${TESTFILE} 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.affinityRun.029streams.loop01.instance005.SOCKET00.CORE004.PU04.log
 taskset 0x10 /root/RdRand /dev/null -t 1 ${SEM_ID} > ${TESTFILE} 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.affinityRun.029streams.loop01.instance006.SOCKET00.CORE005.PU05.log
 taskset 0x20 /root/RdRand /dev/null -t 1 ${SEM_ID} > ${TESTFILE} 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.affinityRun.029streams.loop01.instance007.SOCKET00.CORE006.PU06.log
 taskset 0x40 /root/RdRand /dev/null -t 1 ${SEM_ID} > ${TESTFILE} 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.affinityRun.029streams.loop01.instance008.SOCKET00.CORE007.PU07.log
 taskset 0x80 /root/RdRand /dev/null -t 1 ${SEM_ID} > ${TESTFILE} 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.affinityRun.029streams.loop01.instance009.SOCKET01.CORE000.PU15.log
 taskset 0x8000 /root/RdRand /dev/null -t 1 ${SEM_ID} > ${TESTFILE} 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.affinityRun.029streams.loop01.instance010.SOCKET01.CORE001.PU16.log
 taskset 0x10000 /root/RdRand /dev/null -t 1 ${SEM_ID} > ${TESTFILE} 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.affinityRun.029streams.loop01.instance011.SOCKET01.CORE002.PU17.log
 taskset 0x20000 /root/RdRand /dev/null -t 1 ${SEM_ID} > ${TESTFILE} 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.affinityRun.029streams.loop01.instance012.SOCKET01.CORE003.PU18.log
 taskset 0x40000 /root/RdRand /dev/null -t 1 ${SEM_ID} > ${TESTFILE} 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.affinityRun.029streams.loop01.instance013.SOCKET01.CORE004.PU19.log
 taskset 0x80000 /root/RdRand /dev/null -t 1 ${SEM_ID} > ${TESTFILE} 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.affinityRun.029streams.loop01.instance014.SOCKET01.CORE005.PU20.log
 taskset 0x100000 /root/RdRand /dev/null -t 1 ${SEM_ID} > ${TESTFILE} 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.affinityRun.029streams.loop01.instance015.SOCKET01.CORE006.PU21.log
 taskset 0x200000 /root/RdRand /dev/null -t 1 ${SEM_ID} > ${TESTFILE} 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.affinityRun.029streams.loop01.instance016.SOCKET02.CORE000.PU30.log
 taskset 0x40000000 /root/RdRand /dev/null -t 1 ${SEM_ID} > ${TESTFILE} 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.affinityRun.029streams.loop01.instance017.SOCKET02.CORE001.PU31.log
 taskset 0x80000000 /root/RdRand /dev/null -t 1 ${SEM_ID} > ${TESTFILE} 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.affinityRun.029streams.loop01.instance018.SOCKET02.CORE002.PU32.log
 taskset 0x100000000 /root/RdRand /dev/null -t 1 ${SEM_ID} > ${TESTFILE} 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.affinityRun.029streams.loop01.instance019.SOCKET02.CORE003.PU33.log
 taskset 0x200000000 /root/RdRand /dev/null -t 1 ${SEM_ID} > ${TESTFILE} 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.affinityRun.029streams.loop01.instance020.SOCKET02.CORE004.PU34.log
 taskset 0x400000000 /root/RdRand /dev/null -t 1 ${SEM_ID} > ${TESTFILE} 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.affinityRun.029streams.loop01.instance021.SOCKET02.CORE005.PU35.log
 taskset 0x800000000 /root/RdRand /dev/null -t 1 ${SEM_ID} > ${TESTFILE} 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.affinityRun.029streams.loop01.instance022.SOCKET02.CORE006.PU36.log
 taskset 0x1000000000 /root/RdRand /dev/null -t 1 ${SEM_ID} > ${TESTFILE} 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.affinityRun.029streams.loop01.instance023.SOCKET03.CORE000.PU45.log
 taskset 0x200000000000 /root/RdRand /dev/null -t 1 ${SEM_ID} > ${TESTFILE} 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.affinityRun.029streams.loop01.instance024.SOCKET03.CORE001.PU46.log
 taskset 0x400000000000 /root/RdRand /dev/null -t 1 ${SEM_ID} > ${TESTFILE} 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.affinityRun.029streams.loop01.instance025.SOCKET03.CORE002.PU47.log
 taskset 0x800000000000 /root/RdRand /dev/null -t 1 ${SEM_ID} > ${TESTFILE} 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.affinityRun.029streams.loop01.instance026.SOCKET03.CORE003.PU48.log
 taskset 0x1000000000000 /root/RdRand /dev/null -t 1 ${SEM_ID} > ${TESTFILE} 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.affinityRun.029streams.loop01.instance027.SOCKET03.CORE004.PU49.log
 taskset 0x2000000000000 /root/RdRand /dev/null -t 1 ${SEM_ID} > ${TESTFILE} 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.affinityRun.029streams.loop01.instance028.SOCKET03.CORE005.PU50.log
 taskset 0x4000000000000 /root/RdRand /dev/null -t 1 ${SEM_ID} > ${TESTFILE} 2>&1 &
TESTFILE=/mnt/tests/performance/cpuTestAnalysis2/certification/Results-2013-Oct-27_18h10m03s/RawData/RdRand.affinityRun.029streams.loop01.instance029.SOCKET03.CORE006.PU51.log
 taskset 0x8000000000000 /root/RdRand /dev/null -t 1 ${SEM_ID} > ${TESTFILE} 2>&1 &
date
wait
