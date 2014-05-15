#!/bin/bash
if [ $# -ne 1 ];then
	echo "Usage: $0 DIR"
	exit 0
fi
CDIR=$(pwd)

FILE_SCT="$CDIR/$1/scattering"
FILE_SCL="$CDIR/$1/scaling"
FILE_SZDEP="$CDIR/$1/sizeDependency"

# scattering
gnuplot -e "filename='$FILE_SCT'" plot-scattering.plg

# scaling
gnuplot -e "filename='$FILE_SCL'" plot-scaling.plg

# chunk size dependency
gnuplot -e "filename='$FILE_SZDEP'" plot-chunk.plg

