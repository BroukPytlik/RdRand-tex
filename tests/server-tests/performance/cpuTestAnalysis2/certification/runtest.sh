#!/usr/bin/env bash
#vim: set expandtab cindent fdm=marker ts=2 sw=2:

set -v

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root (required by perf stat)" 1>&2
   exit 1
fi

yum --skip-broken -y install bc screen nfs-utils rsync numactl cpupowerutils hwloc hwloc-devel perf irqbalance vim numad sysstat rpmdevtools

command -v mpstat >/dev/null 2>&1 || { echo >&2 "I require mpstat but it's not installed.  Aborting."; exit 1; }
command -v lstopo >/dev/null 2>&1 || { echo >&2 "I require lstopo but it's not installed.  Aborting."; exit 1; }
command -v gcc >/dev/null 2>&1 || { echo >&2 "I require gcc but it's not installed.  Aborting."; exit 1; }


HOSTNAME=`hostname`

if [ ! -z "${RESULT_SERVER}" ]; then
	DISTRO_NAME=${DISTRO}

	if [ -x /usr/bin/rhts-environment.sh ] ; then
		. /usr/bin/rhts-environment.sh
	fi
else
	if [[ -r /etc/redhat-release ]]; then
		DISTRO_NAME=$(cat /etc/redhat-release | perl -pl -e's/\(.*\)/ /'| perl -pl -e'tr/ /-/'|perl -pl -e's/--$//')
	else
		DISTRO_NAME="unknown"
	fi
fi

#Collect perf record data? Beware - the results can take a lot of disk space!
RUN_PERF_RECORD=false
#RUN_PERF_RECORD=true
NOOFITERATIONS=1
TESTDIR=`pwd`
STARTDATE=`date '+%Y-%b-%d_%Hh%Mm%Ss'`
RESULTSTIME="Results-${STARTDATE}"
RESULTS_DIR="${TESTDIR}/${RESULTSTIME}/RawData"
DISTANCES_DIR="${RESULTS_DIR}/Distances"
mkdir -p $RESULTS_DIR
mkdir -p ${DISTANCES_DIR}
TESTTYPES="defaultRun affinityRun numaRun"
TESTLINPACK="Benchmark-utils/linpacks Benchmark-utils/linpackd"
TESTSTREAM="Benchmark-utils/stream"
#TESTBINARIES="${TESTLINPACK} ${TESTSTREAM}"
TESTBINARIES="/root/RdRand /dev/null -t 1"

# {{{ function compareVersions ver1 ver2
# USAGE
#    compareVersions $1 $2
#    case $? in
#        0) op='=';;
#        11) op='>';;
#        12) op='<';;
#    esac

compareVersions () {
    if  command -v rpmdev-vercmp >/dev/null 2>&1; then 
      rpmdev-vercmp $1 $2
      return $?
    else
      if [[ $1 == $2 ]]; then
        return 0
      fi
      local version=$1 check=$2
      local winner=$(echo -e "$version\n$check" | sed '/^$/d' | sort -t. -nr | head -1)
      if [[ "$winner" == "$version" ]]; then
       return 11
      else
        return 12
      fi    
    fi
}
# }}}

# {{{ function runTest()

function runTest()
{
  local instancesArray="$(seq 1 1 32) $(seq 34 2 64) $(seq 72 8 120)"
  local ToRunOn
  local NUMA_NODES=`getNoNumas`	 

  if [ ${NUMA_NODES} -le 1 ]; 
  then
    TESTTYPES="defaultRun affinityRun"
  #else
    #MeasureNUMADistances ${TESTSTREAM} 0
  fi

  for testBinary in RdRand
  do
    for numberInstances in ${instancesArray}
    do
      ToRunOn=`toRunOn ${numberInstances}`
      for iterationNumber in `seq 1 1 ${NOOFITERATIONS}`
      do
        for testType in ${TESTTYPES}
        do
          runTestITSELF ${testBinary} ${iterationNumber} ${testType} ${ToRunOn}
        done

      done
    done
#Copy results to the server
    #rsync -avz --no-owner --no-group --recursive --chmod=a+r,a+w,a+X ${RESULTSTIME} perf-results.lab.eng.bos.redhat.com::perf/www/linpackStreamResults/${DISTRO_NAME}/${HOSTNAME}
  done
}

# }}} function runTest()

# {{{ function runTestITSELF()
# parametry CestaKProgramu KteryPokusProvadime TypTestu PoleNaJakychJadrechBezime

function runTestITSELF()

{
	 local PROG="/root/RdRand /dev/null -t 1"
	 local PROGNAME="RdRand"
	 local LOOP_CNT=$2
	 local TESTTYPE=$3
	 shift 3;
	 local LIST2RUNON=$*
	 local CPUARRAY=($LIST2RUNON) 
	 local NOSTREAMS=${#CPUARRAY[@]}
	 local PROCESSOR
	 local MPSTATPID
	 local MPSTAT_LOGFILE
	 local CNT=0
	 local COMMAND
	 local TESTFILE
	 local PIDS=""
	 local COMMAND_LOGFILE

	 COMMAND_LOGFILE=`printf "${RESULTS_DIR}/${PROGNAME}.${TESTTYPE}.%03dstreams.loop%02d.sh" $NOSTREAMS $LOOP_CNT`
	 echo '#!/bin/bash -v'				> ${COMMAND_LOGFILE}
	 echo "date"			>> ${COMMAND_LOGFILE}
	 echo "RESULTS_DIR=${RESULTS_DIR}"			>> ${COMMAND_LOGFILE}
	 #echo 'pushd ../..'					>> ${COMMAND_LOGFILE}
	 chmod a+x ${COMMAND_LOGFILE}
	 echo "NOSTREAMS=${NOSTREAMS}"	>> ${COMMAND_LOGFILE}
	 echo "LOOP_CNT=${LOOP_CNT}"		>> ${COMMAND_LOGFILE}
         

#local SEM_ID=`Benchmark-utils/semcreate`
# echo 'SEM_ID=`Benchmark-utils/semcreate`' >> ${COMMAND_LOGFILE}
	
	 for PROCESSOR in ${LIST2RUNON} 
	 do
		  CNT=$((CNT+1))
		  #echo "CNT=${CNT}" >> ${COMMAND_LOGFILE}

		  if [ $TESTTYPE == "defaultRun" ]
		  then
				TESTFILE=`printf "${RESULTS_DIR}/${PROGNAME}.defaultRun.%03dstreams.loop%02d.instance%03d.log" $NOSTREAMS $LOOP_CNT $CNT`
				COMMAND="${COMMAND_PREFIX} ${PROG} ${SEM_ID} > ${TESTFILE} 2>&1 &"
                                echo "TESTFILE=${TESTFILE}" >> ${COMMAND_LOGFILE}
				#echo 'TESTFILE=`printf "${RESULTS_DIR}/'"${PROGNAME}"'.defaultRun.%03dstreams.loop%02d.instance%03d.log" $NOSTREAMS $LOOP_CNT $CNT`' >> ${COMMAND_LOGFILE}
				echo "${COMMAND_PREFIX} ${PROG}" '${SEM_ID} > ${TESTFILE} 2>&1 &' >> ${COMMAND_LOGFILE}
		  fi
		  if [ $TESTTYPE == "affinityRun" ]
		  then
				hexMaskToCpuNo ${PROCESSOR}	

				TESTFILE=`printf "${RESULTS_DIR}/${PROGNAME}.affinityRun.%03dstreams.loop%02d.instance%03d.SOCKET%02d.CORE%03d.PU%02d.log" $NOSTREAMS $LOOP_CNT $CNT $SOCKET $CORE $PU`
				COMMAND="${COMMAND_PREFIX} taskset ${PROCESSOR} ${PROG} ${SEM_ID} > ${TESTFILE} 2>&1 &"
				#echo 'TESTFILE=`printf "${RESULTS_DIR}/'"${PROGNAME}"'.affinityRun.%03dstreams.loop%02d.instance%03d.SOCKET%02d.CORE%03d.PU%02d.log" $NOSTREAMS $LOOP_CNT $CNT' "$SOCKET $CORE $PU"'`' >> ${COMMAND_LOGFILE}
                                echo "TESTFILE=${TESTFILE}" >> ${COMMAND_LOGFILE}
				echo "${COMMAND_PREFIX} taskset ${PROCESSOR} ${PROG}" '${SEM_ID} > ${TESTFILE} 2>&1 &' >> ${COMMAND_LOGFILE}
		  fi
		  if [ $TESTTYPE == "numaRun" ]
		  then
			hexMaskToCpuNo ${PROCESSOR}
			ANODE=`getNumaNodeFromCPU ${PU}`

			TESTFILE=`printf "${RESULTS_DIR}/${PROGNAME}.numaRun.%03dstreams.loop%02d.instance%03d.node%03d.log" $NOSTREAMS $LOOP_CNT $CNT $ANODE`
			COMMAND="${COMMAND_PREFIX} numactl --cpunodebind=${ANODE} --membind=${ANODE} ${PROG} ${SEM_ID} > $TESTFILE 2>&1 &"
			#echo 'TESTFILE=`printf "${RESULTS_DIR}/'"${PROGNAME}"'numaRun.%03dstreams.loop%02d.instance%03d.node%03d.log" $NOSTREAMS $LOOP_CNT $CNT' "$ANODE"'`' >> ${COMMAND_LOGFILE}
			echo "TESTFILE=${TESTFILE}" >> ${COMMAND_LOGFILE}
			echo "${COMMAND_PREFIX} numactl --cpunodebind=${ANODE} --membind=${ANODE} ${PROG}" '${SEM_ID} > $TESTFILE 2>&1 &' >> ${COMMAND_LOGFILE}
                 fi

		  #eval ${COMMAND}
		  #PIDS=`echo $PIDS " " $!`
		  #echo 'PIDS=`echo $PIDS " " $!`' >> ${COMMAND_LOGFILE}
	 done

#	 `Benchmark-utils/semwaitforpids ${SEM_ID} ${CNT}`
#	 echo '`Benchmark_utils/semwaitforpids ${SEM_ID} ${CNT}`' >> ${COMMAND_LOGFILE}

	 #MPSTAT_LOGFILE=`printf "${RESULTS_DIR}/${PROGNAME}.${TESTTYPE}.%03dstreams.loop%02d.mpstat" $NOSTREAMS $LOOP_CNT`
	 #COMMAND="mpstat -P ALL 2 >& ${MPSTAT_LOGFILE} &"
	 #echo 'MPSTAT_LOGFILE=`printf "${RESULTS_DIR}/'"${PROGNAME}.${TESTTYPE}"'.%03dstreams.loop%02d.mpstat" $NOSTREAMS $LOOP_CNT`' >> ${COMMAND_LOGFILE}
	 #echo 'mpstat -P ALL 2 >& ${MPSTAT_LOGFILE} &'  >> ${COMMAND_LOGFILE}
	 #eval ${COMMAND}
	 #MPSTATPID=$!
	 #echo 'MPSTATPID=$!' >> ${COMMAND_LOGFILE}

	if $RUN_PERF_RECORD ; then
#Please do not delete this. It's for the debug purposes here.
#See bellow the kill command also
		PERF_LOGFILE=`printf "${RESULTS_DIR}/${PROGNAME}.${TESTTYPE}.%03dstreams.loop%02d.perf" $NOSTREAMS $LOOP_CNT`
		./perf_record.sh ${PERF_LOGFILE} &
		PERF_PID=$!
	 fi
	 #sleep 2

#	 `Benchmark-utils/semremove ${SEM_ID} ${CNT}`
#	 echo '`sem_progs/semremove ${SEM_ID} ${CNT}`' >> ${COMMAND_LOGFILE}

	 #wait ${PIDS}
	 #echo 'wait ${PIDS}' >> ${COMMAND_LOGFILE}
	 #kill ${MPSTATPID}

	if $RUN_PERF_RECORD ; then
#Please do not delete this. It's for the debug purposes here.
#See also perf_record.sh start few lines up in this file
		kill ${PERF_PID}
		sleep 30
	fi

	 #echo 'kill ${MPSTATPID}' >> ${COMMAND_LOGFILE}
	 #echo 'popd' >> ${COMMAND_LOGFILE}
	 echo "date"			>> ${COMMAND_LOGFILE}
	 echo "wait"			>> ${COMMAND_LOGFILE}

}

# }}} function runTestITSELF()

# {{{ function toRunOn()

function toRunOn()
{
   local ManyCores=$1
   local toRunOn
   local TotalPU=$(getNoCpus)
   if (( "${ManyCores}" < "${TotalPU}" )) ; then
#Avoid using CPU 0
	toRunOn=$(hwloc-distrib --single --taskset --restrict $(hwloc-calc machine:0 ~PU:0) ${ManyCores})
   else
	toRunOn=$(hwloc-distrib --single --taskset $ManyCores)
   fi

   echo ${toRunOn}
}

# }}} function toRunOn()

# {{{ function getNoNumas()

function getNoNumas()
{
	 local NumaString
	 local NoNumaString

	 NumaNo=`numastat |head -1|wc -w`                                                                                                                                   

	 echo ${NumaNo}                                                                                                                                                     
}

# }}} getNoNumas()

# {{{ function getNoCpus()

function getNoCpus
{
	 local noOfCpus
	 noOfCpus=`hwloc-info |grep PU|awk '{print $3}'`

	 echo $noOfCpus	 
}

# }}} function getNoCpus()

# {{{ function getNoCores()

function getNoCores
{
	 local noOfCores
	 noOfCores=`hwloc-info |grep Core|awk '{print $3}'`

	 echo $noOfCores
}

# }}} function getNoCpus()

# {{{ function getNumaNodeFromCPU()
# parameter cpuNumber

function getNumaNodeFromCPU()
{
	 local CPUNUMBER=$1
	 local NODEDIRS=`echo /sys/devices/system/node/node*`
	 local ANODEDIR
	 local ANODE
	 local CPU_IN_NODE

	 for ANODEDIR in ${NODEDIRS}
	 do
		  ANODE=`basename ${ANODEDIR} | sed 's/node//'`
		  
		  if [ -e ${ANODEDIR}/cpu${CPUNUMBER} ]
		  then
				echo ${ANODE}
				return
 		  fi
	 done
}

# }}} function getNumaNodeFromCPU()

# {{{ function hexMaskToCpuNo()
# parameter hexNumber 

function hexMaskToCpuNo()
{
	 SOCKET=`hwloc-calc -p $1 --hierarchical socket|awk -F":" '{print $2}'`
	 CORE=`hwloc-calc -p $1 --hierarchical core|awk -F":" '{print $2}'`
	 PU=`hwloc-calc -p $1 --hierarchical PU|awk -F":" '{print $2}'`
}

# }}} function hexMaskToCpuNo()

# {{{ function generateTestingArray

function generateTestingArray()
{
	 local cpusNo=`getNoCpus`
         local coresNo=$(getNoCores)
         local socketsNo=$(hwloc-info |grep Socket|awk '{print $3}')

         local testingArray
         if (( ${cpusNo} < 8 )); then
           testingArray=`echo 1 $(seq 2 2 ${cpusNo})`
         else
		 if (( ${coresNo} < ${cpusNo} )); then
		 #Hyper-threading is enabled
		   local next=$(( coresNo+socketsNo ))
		   testingArray=`echo 1 2 4 $(seq 8 4 ${coresNo}) $(seq ${next} ${socketsNo} ${cpusNo})`
		 else
		   testingArray=`echo 1 2 4 $(seq 8 4 ${cpusNo})`
		 fi
         fi
	 echo ${testingArray}
}

# }}} function generateTestingArray

# {{{ function compileBenchmarks()

function compileBenchmarks()
{
	 cd ${TESTDIR}/Benchmark-utils/linpack-source/
	 make

	 cd ${TESTDIR}/Benchmark-utils/stream-source/
	 make
	 
	 cd ${TESTDIR}/Benchmark-utils/sem_progs-source/
	 make

	 cd ${TESTDIR}
}

# }}} function compileBenchmarks()

#{{{ function storeInBeaker()

function storeInBeaker()
{
	 if [ ! -z "${RESULT_SERVER}" ]; then
		  tar cfvz ${RESULTSTIME}.tar.gz ${RESULTSTIME}
		  rhts-submit-log -T ${RECIPETESTID} -S ${RESULT_SERVER} -l ${RESULTSTIME}.tar.gz
		  report_result $TEST/SUMMARY PASS

	 fi 
}

#}}} function storeInBeaker()

#{{{ MeasureNUMADistances
#Input PathToBinary RunNumber
function MeasureNUMADistances() {
  local PROG="/root/RdRand /dev/null -t 1"
  local PROGNAME="RdRand"
  local LOOP_CNT=$2
  local NUMA_NODES=$(hwloc-calc -N NUMANode machine:0)
  ((--NUMA_NODES))
  local CORE
  local PU
  local COMMAND
  local TESTFILE
  local COMMAND_LOGFILE
  local CPUBIND_NAME
  local LOOP_NAME

 COMMAND_LOGFILE=`printf "${DISTANCES_DIR}/${PROGNAME}.loop%02d.sh" $LOOP_CNT`
 echo '#!/bin/bash -v'				> ${COMMAND_LOGFILE}
 echo 'DISTANCES_DIR=`pwd`'			>> ${COMMAND_LOGFILE}
 chmod a+x ${COMMAND_LOGFILE}
 echo "LOOP_CNT=${LOOP_CNT}"		>> ${COMMAND_LOGFILE}
 echo "PROG=../../${PROG}"		>> ${COMMAND_LOGFILE}
 echo 'PROGNAME=$(basename ${PROG})' >> ${COMMAND_LOGFILE}

 for CPUBIND in `seq 0 1 ${NUMA_NODES}`; do
#Get the last PU on that Socket
#PU=$(hwloc-calc --physical-output --intersect pu node:${CPUBIND} | rev | cut -d, -f1 | rev)
   for CORE in $(hwloc-calc --sep " " --intersect core node:${CPUBIND}); do
     PU=$(hwloc-calc --physical-output --intersect pu core:${CORE} | tr , "\n" | sort -n | head -1)
     for MEMBIND in `seq 0 1 ${NUMA_NODES}`; do
       TESTFILE=`printf "${DISTANCES_DIR}/${PROGNAME}.membind%02d.cpubind%02d.PU%03d.loop%02d.log" ${MEMBIND} ${CPUBIND} ${PU} $LOOP_CNT`
       COMMAND="${COMMAND_PREFIX} hwloc-bind --physical --strict --single --cpubind pu:${PU} --membind node:${MEMBIND} ${PROG} > $TESTFILE 2>&1"
       echo 'TESTFILE=`printf "${DISTANCES_DIR}/${PROGNAME}.membind%02d.cpubind%02d.PU%03d.loop%02d.log" '"${MEMBIND} ${CPUBIND} ${PU} "'$LOOP_CNT`' >> ${COMMAND_LOGFILE}
       echo "${COMMAND_PREFIX} hwloc-bind --physical --strict --single --cpubind pu:${PU} --membind node:${MEMBIND} "'${PROG} > $TESTFILE 2>&1' >> ${COMMAND_LOGFILE}
       eval ${COMMAND}
     done
   done
   pushd ${DISTANCES_DIR}
   CPUBIND_NAME=$(printf "cpubind%02d" ${CPUBIND})
   LOOP_NAME=$(printf "loop%02d" ${LOOP_CNT})
   grep elapsed: ${PROGNAME}.*.${CPUBIND_NAME}.*.${LOOP_NAME}.log > ${PROGNAME}.runtime.${CPUBIND_NAME}.${LOOP_NAME}.summary
   popd
 done
}
#}}}

#{{{ InitCommandPrefix
function InitCommandPrefix() {
  local KERNEL_VERSION=$(uname -r)
  local COMMAND_PREFIX
  compareVersions ${KERNEL_VERSION} 2.6.31 >/dev/null 2>&1
  if (( $? == 12 )); then
    COMMAND_PREFIX=""
  else
    command -v turbostat >/dev/null 2>&1 || { echo >&2 "I require turbostat but it's not installed.  Aborting."; exit 1; }
    command -v perf >/dev/null 2>&1 || { echo >&2 "I require perf but it's not installed.  Aborting."; exit 1; }

    local PERF_VERSION=$(perf --version | rev | cut -d" " -f1 | rev)
    compareVersions ${PERF_VERSION} 3.8.0 >/dev/null 2>&1
    if (( $? == 12 )); then
      COMMAND_PREFIX="turbostat perf stat -e task-clock,context-switches,cpu-migrations,page-faults,cycles,stalled-cycles-frontend,stalled-cycles-backend,instructions,cache-references,cache-misses,LLC-loads,LLC-load-misses,LLC-stores,LLC-store-misses,LLC-prefetches,LLC-prefetch-misses"
    else
      COMMAND_PREFIX="turbostat perf stat -e task-clock,context-switches,cpu-migrations,page-faults,cycles,stalled-cycles-frontend,stalled-cycles-backend,instructions,cache-references,cache-misses,LLC-loads,LLC-load-misses,LLC-stores,LLC-store-misses,LLC-prefetches,LLC-prefetch-misses,node-loads,node-load-misses,node-stores,node-store-misses,node-prefetches,node-prefetch-misses"
    fi
  fi
  echo ${COMMAND_PREFIX}
}
#}}}

lstopo ${RESULTS_DIR}/topo.png
compileBenchmarks

#mkdir -p DUMMY
#Create directory on server
#rsync -avz --no-owner --no-group --recursive --chmod=a+r,a+w,a+X DUMMY/ perf-results.lab.eng.bos.redhat.com::perf/www/linpackStreamResults/${DISTRO_NAME}
#rsync -avz --no-owner --no-group --recursive --chmod=a+r,a+w,a+X DUMMY/ perf-results.lab.eng.bos.redhat.com::perf/www/linpackStreamResults/${DISTRO_NAME}/${HOSTNAME}

COMMAND_PREFIX=""
#COMMAND_PREFIX=$(InitCommandPrefix)
runTest
#Copy results to the server
#rsync -avz --no-owner --no-group --recursive --chmod=a+r,a+w,a+X ${RESULTSTIME} perf-results.lab.eng.bos.redhat.com::perf/www/linpackStreamResults/${DISTRO_NAME}/${HOSTNAME}
#storeInBeaker


