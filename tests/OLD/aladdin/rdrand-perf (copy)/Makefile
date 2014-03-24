FILE_SCT=scattering__hp-aladdin-01.lab.bos.redhat.com_2013-12-23_08-40-25.dat
FILE_SCL=scaling__hp-aladdin-01.lab.bos.redhat.com_2013-12-23_08-40-25.dat
FILE_SZDEP=sizeDependency__hp-aladdin-01.lab.bos.redhat.com_2013-12-23_08-40-25.dat

all:
    gnuplot -e "filename='${FILE_SCT}'" plot-scattering.plg
    gnuplot -e "filename='${FILE_SCL}'" plot-scaling.plg
    gnuplot -e "filename='${FILE_SZDEP}'" plot-chunk.plg
