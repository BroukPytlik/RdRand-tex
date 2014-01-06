#!/usr/bin/gnuplot

set boxwidth 0.9 absolute
#set style fill solid 1.00 border lt -1
set style fill pattern 1 border lt -1
set key inside right top vertical Right noreverse noenhanced autotitles nobox
set style histogram clustered gap 1 title  offset character 0, 0, 0
set datafile missing '-'
set style data histograms
#set xtics border in scale 0,0 nomirror rotate by -45  offset character 0, 0, 0 autojustify
set xtics  norangelimit font ",8"
set xtics   ()
set yrange [ 0 : ] noreverse nowriteback
set xlabel "Threads";
set ylabel "MiB/s";

set terminal pngcairo  enhanced font "arial,10" fontscale 1.0 size 800,400
set output 'DELETE_ME.png'
plot 'difference.dat' using 2:xtic(1) ti col, '' u 3 ti col, '' u 4 ti col, '' u 5 ti col
# to get max
set offsets 0,0,GPVAL_DATA_Y_MAX/4.8,0
set output 'difference.png'
plot 'difference.dat' using 2:xtic(1) ti col, '' u 3 ti col, '' u 4 ti col, '' u 5 ti col


set terminal postscript eps fontscale 1.5 colour size 15cm,9cm
set output 'difference.eps'
plot 'difference.dat' using 2:xtic(1) ti col, '' u 3 ti col, '' u 4 ti col, '' u 5 ti col
