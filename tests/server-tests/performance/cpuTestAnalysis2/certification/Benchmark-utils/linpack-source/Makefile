#ORIGINAL LINES
#cc -DSP -DUNROLL clinpack.c -lm -o linpacks
#cc -DDP -DUNROLL clinpack.c -lm -o linpackd

CFLAGS=-O2 -DUNROLL -Wall -Wextra -Wshadow
LIBS= -lm -lrt
LIBS+= $(shell pkg-config --libs hwloc) 

all:	clean linpacks linpackd

config.h:
	rm -rf sched_getcpu_test
	if ( gcc -o sched_getcpu_test sched_getcpu_test.c && ./sched_getcpu_test ) ; then echo "#define HAVE_SCHED_GETCPU 1" > config.h ; else echo "#define HAVE_SCHED_GETCPU 0" > config.h ; fi
	if ( gcc -o clock_gettime_test clock_gettime_test.c -lrt && ./clock_gettime_test ) ; then echo "#define HAVE_CLOCK_GETTIME 1" >> config.h ; else echo "#define HAVE_CLOCK_GETTIME 0" >> config.h ; fi
	if ( gcc -o hwloc_test hwloc_test.c -lhwloc && ./hwloc_test ) ; then echo "#define HAVE_HWLOC 1" >> config.h ; else echo "#define HAVE_HWLOC 0" >> config.h ; fi
	echo "#define USE_DYNAMIC_ARRAYS 0" >> config.h

clinpacks.o: clinpack.c config.h
	$(CC) $(CFLAGS) -DSP -c $< -o $@

linpacks: clinpacks.o
	$(CC) $< $(LIBS) -o ../$@

clinpackd.o: clinpack.c config.h
	$(CC) $(CFLAGS) -DDP -c $< -o $@

linpackd: clinpackd.o
	$(CC) $< $(LIBS) -o ../$@

clean:
	rm -rf ../linpacks ../linpackd clinpacks.o clinpackd.o
	rm -rf config.h sched_getcpu_test clock_gettime_test hwloc_test
