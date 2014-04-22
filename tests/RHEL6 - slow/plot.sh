#!/usr/bin/env gnuplot

set boxwidth 0.9 absolute
#set style fill solid 1.00 border lt -1
set style fill pattern 4 border lt -1 
#set style fill solid 1 border lt -1 
set key inside right top vertical Right noreverse noenhanced autotitles nobox
set style histogram clustered gap 1 title  offset character 0, 0, 0
set datafile missing '-'
set style data histograms
#set xtics border in scale 0,0 nomirror rotate by -45  offset character 0, 0, 0 autojustify
set xtics  norangelimit font ",8"
set xtics   ()
set yrange [ 0 : ] noreverse nowriteback
set xlabel "Processes";
set ylabel "MiB/s";

# draw it two times, at first to get the maximum value
set terminal pngcairo  enhanced font "arial,10" fontscale 1.0 size 800,400
set output 'DELETE_ME.png'
plot 'r6_parallel.csv' using 2:xtic(1) ti col, '' u 3 ti col, '' u 4 ti col, '' u 5 ti col
# compute the offsets - smaller number -> lower columns
set offsets 0,0,GPVAL_DATA_Y_MAX/4.6,0
# draw it again, this time to save it
set output 'r6_parallel.png'
#plot 'difference.dat' using 2:xtic(1) ti col, '' u 3 ti col, '' u 4 ti col, '' u 5 ti col
plot 'r6_parallel.csv' using 2:xtic(1) ti col fs pattern 1 bo -1,\
	'' u 3 ti col fs pattern 2,\


set terminal postscript eps enhanced solid fontscale 1.5 colour size 15cm,9cm
set output 'r6_parallel.eps'
plot 'r6_parallel.csv' using 2:xtic(1) ti col fs pattern 1 bo -1,\
	'' u 3 ti col fs pattern 2,\

