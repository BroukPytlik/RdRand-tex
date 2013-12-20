#!/bin/bash -v
DISTANCES_DIR=`pwd`
LOOP_CNT=0
PROG=../..//root/RdRand /dev/null -t 1 -d 3 -c 3
PROGNAME=$(basename ${PROG})
TESTFILE=`printf "${DISTANCES_DIR}/${PROGNAME}.membind%02d.cpubind%02d.PU%03d.loop%02d.log" 0 0 0 $LOOP_CNT`
 hwloc-bind --physical --strict --single --cpubind pu:0 --membind node:0 ${PROG} > $TESTFILE 2>&1
TESTFILE=`printf "${DISTANCES_DIR}/${PROGNAME}.membind%02d.cpubind%02d.PU%03d.loop%02d.log" 1 0 0 $LOOP_CNT`
 hwloc-bind --physical --strict --single --cpubind pu:0 --membind node:1 ${PROG} > $TESTFILE 2>&1
TESTFILE=`printf "${DISTANCES_DIR}/${PROGNAME}.membind%02d.cpubind%02d.PU%03d.loop%02d.log" 2 0 0 $LOOP_CNT`
 hwloc-bind --physical --strict --single --cpubind pu:0 --membind node:2 ${PROG} > $TESTFILE 2>&1
TESTFILE=`printf "${DISTANCES_DIR}/${PROGNAME}.membind%02d.cpubind%02d.PU%03d.loop%02d.log" 3 0 0 $LOOP_CNT`
 hwloc-bind --physical --strict --single --cpubind pu:0 --membind node:3 ${PROG} > $TESTFILE 2>&1
TESTFILE=`printf "${DISTANCES_DIR}/${PROGNAME}.membind%02d.cpubind%02d.PU%03d.loop%02d.log" 0 0 1 $LOOP_CNT`
 hwloc-bind --physical --strict --single --cpubind pu:1 --membind node:0 ${PROG} > $TESTFILE 2>&1
TESTFILE=`printf "${DISTANCES_DIR}/${PROGNAME}.membind%02d.cpubind%02d.PU%03d.loop%02d.log" 1 0 1 $LOOP_CNT`
 hwloc-bind --physical --strict --single --cpubind pu:1 --membind node:1 ${PROG} > $TESTFILE 2>&1
TESTFILE=`printf "${DISTANCES_DIR}/${PROGNAME}.membind%02d.cpubind%02d.PU%03d.loop%02d.log" 2 0 1 $LOOP_CNT`
 hwloc-bind --physical --strict --single --cpubind pu:1 --membind node:2 ${PROG} > $TESTFILE 2>&1
TESTFILE=`printf "${DISTANCES_DIR}/${PROGNAME}.membind%02d.cpubind%02d.PU%03d.loop%02d.log" 3 0 1 $LOOP_CNT`
 hwloc-bind --physical --strict --single --cpubind pu:1 --membind node:3 ${PROG} > $TESTFILE 2>&1
TESTFILE=`printf "${DISTANCES_DIR}/${PROGNAME}.membind%02d.cpubind%02d.PU%03d.loop%02d.log" 0 0 2 $LOOP_CNT`
 hwloc-bind --physical --strict --single --cpubind pu:2 --membind node:0 ${PROG} > $TESTFILE 2>&1
TESTFILE=`printf "${DISTANCES_DIR}/${PROGNAME}.membind%02d.cpubind%02d.PU%03d.loop%02d.log" 1 0 2 $LOOP_CNT`
 hwloc-bind --physical --strict --single --cpubind pu:2 --membind node:1 ${PROG} > $TESTFILE 2>&1
TESTFILE=`printf "${DISTANCES_DIR}/${PROGNAME}.membind%02d.cpubind%02d.PU%03d.loop%02d.log" 2 0 2 $LOOP_CNT`
 hwloc-bind --physical --strict --single --cpubind pu:2 --membind node:2 ${PROG} > $TESTFILE 2>&1
TESTFILE=`printf "${DISTANCES_DIR}/${PROGNAME}.membind%02d.cpubind%02d.PU%03d.loop%02d.log" 3 0 2 $LOOP_CNT`
 hwloc-bind --physical --strict --single --cpubind pu:2 --membind node:3 ${PROG} > $TESTFILE 2>&1
TESTFILE=`printf "${DISTANCES_DIR}/${PROGNAME}.membind%02d.cpubind%02d.PU%03d.loop%02d.log" 0 0 3 $LOOP_CNT`
 hwloc-bind --physical --strict --single --cpubind pu:3 --membind node:0 ${PROG} > $TESTFILE 2>&1
TESTFILE=`printf "${DISTANCES_DIR}/${PROGNAME}.membind%02d.cpubind%02d.PU%03d.loop%02d.log" 1 0 3 $LOOP_CNT`
 hwloc-bind --physical --strict --single --cpubind pu:3 --membind node:1 ${PROG} > $TESTFILE 2>&1
TESTFILE=`printf "${DISTANCES_DIR}/${PROGNAME}.membind%02d.cpubind%02d.PU%03d.loop%02d.log" 2 0 3 $LOOP_CNT`
 hwloc-bind --physical --strict --single --cpubind pu:3 --membind node:2 ${PROG} > $TESTFILE 2>&1
TESTFILE=`printf "${DISTANCES_DIR}/${PROGNAME}.membind%02d.cpubind%02d.PU%03d.loop%02d.log" 3 0 3 $LOOP_CNT`
 hwloc-bind --physical --strict --single --cpubind pu:3 --membind node:3 ${PROG} > $TESTFILE 2>&1
TESTFILE=`printf "${DISTANCES_DIR}/${PROGNAME}.membind%02d.cpubind%02d.PU%03d.loop%02d.log" 0 0 4 $LOOP_CNT`
 hwloc-bind --physical --strict --single --cpubind pu:4 --membind node:0 ${PROG} > $TESTFILE 2>&1
TESTFILE=`printf "${DISTANCES_DIR}/${PROGNAME}.membind%02d.cpubind%02d.PU%03d.loop%02d.log" 1 0 4 $LOOP_CNT`
 hwloc-bind --physical --strict --single --cpubind pu:4 --membind node:1 ${PROG} > $TESTFILE 2>&1
TESTFILE=`printf "${DISTANCES_DIR}/${PROGNAME}.membind%02d.cpubind%02d.PU%03d.loop%02d.log" 2 0 4 $LOOP_CNT`
 hwloc-bind --physical --strict --single --cpubind pu:4 --membind node:2 ${PROG} > $TESTFILE 2>&1
TESTFILE=`printf "${DISTANCES_DIR}/${PROGNAME}.membind%02d.cpubind%02d.PU%03d.loop%02d.log" 3 0 4 $LOOP_CNT`
 hwloc-bind --physical --strict --single --cpubind pu:4 --membind node:3 ${PROG} > $TESTFILE 2>&1
TESTFILE=`printf "${DISTANCES_DIR}/${PROGNAME}.membind%02d.cpubind%02d.PU%03d.loop%02d.log" 0 0 5 $LOOP_CNT`
 hwloc-bind --physical --strict --single --cpubind pu:5 --membind node:0 ${PROG} > $TESTFILE 2>&1
TESTFILE=`printf "${DISTANCES_DIR}/${PROGNAME}.membind%02d.cpubind%02d.PU%03d.loop%02d.log" 1 0 5 $LOOP_CNT`
 hwloc-bind --physical --strict --single --cpubind pu:5 --membind node:1 ${PROG} > $TESTFILE 2>&1
TESTFILE=`printf "${DISTANCES_DIR}/${PROGNAME}.membind%02d.cpubind%02d.PU%03d.loop%02d.log" 2 0 5 $LOOP_CNT`
 hwloc-bind --physical --strict --single --cpubind pu:5 --membind node:2 ${PROG} > $TESTFILE 2>&1
TESTFILE=`printf "${DISTANCES_DIR}/${PROGNAME}.membind%02d.cpubind%02d.PU%03d.loop%02d.log" 3 0 5 $LOOP_CNT`
 hwloc-bind --physical --strict --single --cpubind pu:5 --membind node:3 ${PROG} > $TESTFILE 2>&1
TESTFILE=`printf "${DISTANCES_DIR}/${PROGNAME}.membind%02d.cpubind%02d.PU%03d.loop%02d.log" 0 0 6 $LOOP_CNT`
 hwloc-bind --physical --strict --single --cpubind pu:6 --membind node:0 ${PROG} > $TESTFILE 2>&1
TESTFILE=`printf "${DISTANCES_DIR}/${PROGNAME}.membind%02d.cpubind%02d.PU%03d.loop%02d.log" 1 0 6 $LOOP_CNT`
 hwloc-bind --physical --strict --single --cpubind pu:6 --membind node:1 ${PROG} > $TESTFILE 2>&1
TESTFILE=`printf "${DISTANCES_DIR}/${PROGNAME}.membind%02d.cpubind%02d.PU%03d.loop%02d.log" 2 0 6 $LOOP_CNT`
 hwloc-bind --physical --strict --single --cpubind pu:6 --membind node:2 ${PROG} > $TESTFILE 2>&1
TESTFILE=`printf "${DISTANCES_DIR}/${PROGNAME}.membind%02d.cpubind%02d.PU%03d.loop%02d.log" 3 0 6 $LOOP_CNT`
 hwloc-bind --physical --strict --single --cpubind pu:6 --membind node:3 ${PROG} > $TESTFILE 2>&1
TESTFILE=`printf "${DISTANCES_DIR}/${PROGNAME}.membind%02d.cpubind%02d.PU%03d.loop%02d.log" 0 0 7 $LOOP_CNT`
 hwloc-bind --physical --strict --single --cpubind pu:7 --membind node:0 ${PROG} > $TESTFILE 2>&1
TESTFILE=`printf "${DISTANCES_DIR}/${PROGNAME}.membind%02d.cpubind%02d.PU%03d.loop%02d.log" 1 0 7 $LOOP_CNT`
 hwloc-bind --physical --strict --single --cpubind pu:7 --membind node:1 ${PROG} > $TESTFILE 2>&1
TESTFILE=`printf "${DISTANCES_DIR}/${PROGNAME}.membind%02d.cpubind%02d.PU%03d.loop%02d.log" 2 0 7 $LOOP_CNT`
 hwloc-bind --physical --strict --single --cpubind pu:7 --membind node:2 ${PROG} > $TESTFILE 2>&1
TESTFILE=`printf "${DISTANCES_DIR}/${PROGNAME}.membind%02d.cpubind%02d.PU%03d.loop%02d.log" 3 0 7 $LOOP_CNT`
 hwloc-bind --physical --strict --single --cpubind pu:7 --membind node:3 ${PROG} > $TESTFILE 2>&1
TESTFILE=`printf "${DISTANCES_DIR}/${PROGNAME}.membind%02d.cpubind%02d.PU%03d.loop%02d.log" 0 0 8 $LOOP_CNT`
 hwloc-bind --physical --strict --single --cpubind pu:8 --membind node:0 ${PROG} > $TESTFILE 2>&1
TESTFILE=`printf "${DISTANCES_DIR}/${PROGNAME}.membind%02d.cpubind%02d.PU%03d.loop%02d.log" 1 0 8 $LOOP_CNT`
 hwloc-bind --physical --strict --single --cpubind pu:8 --membind node:1 ${PROG} > $TESTFILE 2>&1
TESTFILE=`printf "${DISTANCES_DIR}/${PROGNAME}.membind%02d.cpubind%02d.PU%03d.loop%02d.log" 2 0 8 $LOOP_CNT`
 hwloc-bind --physical --strict --single --cpubind pu:8 --membind node:2 ${PROG} > $TESTFILE 2>&1
TESTFILE=`printf "${DISTANCES_DIR}/${PROGNAME}.membind%02d.cpubind%02d.PU%03d.loop%02d.log" 3 0 8 $LOOP_CNT`
 hwloc-bind --physical --strict --single --cpubind pu:8 --membind node:3 ${PROG} > $TESTFILE 2>&1
TESTFILE=`printf "${DISTANCES_DIR}/${PROGNAME}.membind%02d.cpubind%02d.PU%03d.loop%02d.log" 0 0 9 $LOOP_CNT`
 hwloc-bind --physical --strict --single --cpubind pu:9 --membind node:0 ${PROG} > $TESTFILE 2>&1
TESTFILE=`printf "${DISTANCES_DIR}/${PROGNAME}.membind%02d.cpubind%02d.PU%03d.loop%02d.log" 1 0 9 $LOOP_CNT`
 hwloc-bind --physical --strict --single --cpubind pu:9 --membind node:1 ${PROG} > $TESTFILE 2>&1
TESTFILE=`printf "${DISTANCES_DIR}/${PROGNAME}.membind%02d.cpubind%02d.PU%03d.loop%02d.log" 2 0 9 $LOOP_CNT`
 hwloc-bind --physical --strict --single --cpubind pu:9 --membind node:2 ${PROG} > $TESTFILE 2>&1
TESTFILE=`printf "${DISTANCES_DIR}/${PROGNAME}.membind%02d.cpubind%02d.PU%03d.loop%02d.log" 3 0 9 $LOOP_CNT`
 hwloc-bind --physical --strict --single --cpubind pu:9 --membind node:3 ${PROG} > $TESTFILE 2>&1
TESTFILE=`printf "${DISTANCES_DIR}/${PROGNAME}.membind%02d.cpubind%02d.PU%03d.loop%02d.log" 0 0 10 $LOOP_CNT`
 hwloc-bind --physical --strict --single --cpubind pu:10 --membind node:0 ${PROG} > $TESTFILE 2>&1
TESTFILE=`printf "${DISTANCES_DIR}/${PROGNAME}.membind%02d.cpubind%02d.PU%03d.loop%02d.log" 1 0 10 $LOOP_CNT`
 hwloc-bind --physical --strict --single --cpubind pu:10 --membind node:1 ${PROG} > $TESTFILE 2>&1
TESTFILE=`printf "${DISTANCES_DIR}/${PROGNAME}.membind%02d.cpubind%02d.PU%03d.loop%02d.log" 2 0 10 $LOOP_CNT`
 hwloc-bind --physical --strict --single --cpubind pu:10 --membind node:2 ${PROG} > $TESTFILE 2>&1
TESTFILE=`printf "${DISTANCES_DIR}/${PROGNAME}.membind%02d.cpubind%02d.PU%03d.loop%02d.log" 3 0 10 $LOOP_CNT`
 hwloc-bind --physical --strict --single --cpubind pu:10 --membind node:3 ${PROG} > $TESTFILE 2>&1
TESTFILE=`printf "${DISTANCES_DIR}/${PROGNAME}.membind%02d.cpubind%02d.PU%03d.loop%02d.log" 0 0 11 $LOOP_CNT`
 hwloc-bind --physical --strict --single --cpubind pu:11 --membind node:0 ${PROG} > $TESTFILE 2>&1
TESTFILE=`printf "${DISTANCES_DIR}/${PROGNAME}.membind%02d.cpubind%02d.PU%03d.loop%02d.log" 1 0 11 $LOOP_CNT`
 hwloc-bind --physical --strict --single --cpubind pu:11 --membind node:1 ${PROG} > $TESTFILE 2>&1
TESTFILE=`printf "${DISTANCES_DIR}/${PROGNAME}.membind%02d.cpubind%02d.PU%03d.loop%02d.log" 2 0 11 $LOOP_CNT`
 hwloc-bind --physical --strict --single --cpubind pu:11 --membind node:2 ${PROG} > $TESTFILE 2>&1
TESTFILE=`printf "${DISTANCES_DIR}/${PROGNAME}.membind%02d.cpubind%02d.PU%03d.loop%02d.log" 3 0 11 $LOOP_CNT`
 hwloc-bind --physical --strict --single --cpubind pu:11 --membind node:3 ${PROG} > $TESTFILE 2>&1
TESTFILE=`printf "${DISTANCES_DIR}/${PROGNAME}.membind%02d.cpubind%02d.PU%03d.loop%02d.log" 0 0 12 $LOOP_CNT`
 hwloc-bind --physical --strict --single --cpubind pu:12 --membind node:0 ${PROG} > $TESTFILE 2>&1
TESTFILE=`printf "${DISTANCES_DIR}/${PROGNAME}.membind%02d.cpubind%02d.PU%03d.loop%02d.log" 1 0 12 $LOOP_CNT`
 hwloc-bind --physical --strict --single --cpubind pu:12 --membind node:1 ${PROG} > $TESTFILE 2>&1
TESTFILE=`printf "${DISTANCES_DIR}/${PROGNAME}.membind%02d.cpubind%02d.PU%03d.loop%02d.log" 2 0 12 $LOOP_CNT`
 hwloc-bind --physical --strict --single --cpubind pu:12 --membind node:2 ${PROG} > $TESTFILE 2>&1
TESTFILE=`printf "${DISTANCES_DIR}/${PROGNAME}.membind%02d.cpubind%02d.PU%03d.loop%02d.log" 3 0 12 $LOOP_CNT`
 hwloc-bind --physical --strict --single --cpubind pu:12 --membind node:3 ${PROG} > $TESTFILE 2>&1
TESTFILE=`printf "${DISTANCES_DIR}/${PROGNAME}.membind%02d.cpubind%02d.PU%03d.loop%02d.log" 0 0 13 $LOOP_CNT`
 hwloc-bind --physical --strict --single --cpubind pu:13 --membind node:0 ${PROG} > $TESTFILE 2>&1
TESTFILE=`printf "${DISTANCES_DIR}/${PROGNAME}.membind%02d.cpubind%02d.PU%03d.loop%02d.log" 1 0 13 $LOOP_CNT`
 hwloc-bind --physical --strict --single --cpubind pu:13 --membind node:1 ${PROG} > $TESTFILE 2>&1
TESTFILE=`printf "${DISTANCES_DIR}/${PROGNAME}.membind%02d.cpubind%02d.PU%03d.loop%02d.log" 2 0 13 $LOOP_CNT`
 hwloc-bind --physical --strict --single --cpubind pu:13 --membind node:2 ${PROG} > $TESTFILE 2>&1
TESTFILE=`printf "${DISTANCES_DIR}/${PROGNAME}.membind%02d.cpubind%02d.PU%03d.loop%02d.log" 3 0 13 $LOOP_CNT`
 hwloc-bind --physical --strict --single --cpubind pu:13 --membind node:3 ${PROG} > $TESTFILE 2>&1
TESTFILE=`printf "${DISTANCES_DIR}/${PROGNAME}.membind%02d.cpubind%02d.PU%03d.loop%02d.log" 0 0 14 $LOOP_CNT`
 hwloc-bind --physical --strict --single --cpubind pu:14 --membind node:0 ${PROG} > $TESTFILE 2>&1
TESTFILE=`printf "${DISTANCES_DIR}/${PROGNAME}.membind%02d.cpubind%02d.PU%03d.loop%02d.log" 1 0 14 $LOOP_CNT`
 hwloc-bind --physical --strict --single --cpubind pu:14 --membind node:1 ${PROG} > $TESTFILE 2>&1
TESTFILE=`printf "${DISTANCES_DIR}/${PROGNAME}.membind%02d.cpubind%02d.PU%03d.loop%02d.log" 2 0 14 $LOOP_CNT`
 hwloc-bind --physical --strict --single --cpubind pu:14 --membind node:2 ${PROG} > $TESTFILE 2>&1
TESTFILE=`printf "${DISTANCES_DIR}/${PROGNAME}.membind%02d.cpubind%02d.PU%03d.loop%02d.log" 3 0 14 $LOOP_CNT`
 hwloc-bind --physical --strict --single --cpubind pu:14 --membind node:3 ${PROG} > $TESTFILE 2>&1
TESTFILE=`printf "${DISTANCES_DIR}/${PROGNAME}.membind%02d.cpubind%02d.PU%03d.loop%02d.log" 0 1 15 $LOOP_CNT`
 hwloc-bind --physical --strict --single --cpubind pu:15 --membind node:0 ${PROG} > $TESTFILE 2>&1
TESTFILE=`printf "${DISTANCES_DIR}/${PROGNAME}.membind%02d.cpubind%02d.PU%03d.loop%02d.log" 1 1 15 $LOOP_CNT`
 hwloc-bind --physical --strict --single --cpubind pu:15 --membind node:1 ${PROG} > $TESTFILE 2>&1
TESTFILE=`printf "${DISTANCES_DIR}/${PROGNAME}.membind%02d.cpubind%02d.PU%03d.loop%02d.log" 2 1 15 $LOOP_CNT`
 hwloc-bind --physical --strict --single --cpubind pu:15 --membind node:2 ${PROG} > $TESTFILE 2>&1
