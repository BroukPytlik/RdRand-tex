#!/bin/sh
FILE=gnuplot.txt

for RUN in default affinity numa 
  do
  for jobs in $(seq 1 1 32) $(seq 34 2 64) $(seq 72 8 120)
  do
  N=$(printf %03d $jobs)
  SUM=$(grep rdrand_get_uint64_retry RdRand.${RUN}Run.${N}streams.loop01.*log | cut -d " " -f2 | paste -sd+ | bc -l)
  echo $jobs $SUM
  done
  echo
  echo
done > ${FILE}

gnuplot -persist << EOF
set title "${FILE}"
set xlabel "CPU"
set xrange [0:120]
set grid
plot "${FILE}" index 0 w lp title 'Default', '' index 1 w lp title 'Affinity', '' index 2 w lp ls 3 title 'NUMA'
EOF

