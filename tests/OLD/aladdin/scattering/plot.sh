#!/usr/bin/gnuplot

#set terminal svg  mouse #size 600,400
#set output '32-64bit.svg'


binwidth=1
bin(x,width)=width*floor(x/width)

set boxwidth 0.9*binwidth
#set style fill solid 1.00 border lt -1
set style fill pattern 1 border lt -1
set key inside right top vertical Right noreverse noenhanced autotitles nobox
set style histogram clustered gap 1 title  offset character 0, 0, 0
set datafile missing '-'
set style data histograms
#set xtics border in scale 0,0 nomirror rotate by -45  offset character 0, 0, 0 autojustify
set xtics  norangelimit font ",8"
set xtics   ()
set yrange [ 0 :  ] noreverse nowriteback
set xlabel "MiB/s";
set ylabel "Frequency";


set terminal pngcairo  enhanced font "arial,10" fontscale 1.0 size 800,300
set output 'scattering_test.png'
plot 'scattering_test.dat' using (bin($1,binwidth)):(1.0) smooth freq with boxes notitle

set terminal postscript eps fontscale 1.5 colour size 12cm,6cm
set output 'scattering_test.eps'
plot 'scattering_test.dat' using (bin($1,binwidth)):(1.0) smooth freq with boxes notitle
