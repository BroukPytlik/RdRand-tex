CFLAGS=-O2 -Wall -Wextra -Wshadow
LIBS=-lrt
LIBS+= $(shell pkg-config --libs hwloc)

all:	clean stream

config.h:
	rm -rf sched_getcpu_test
	if ( gcc -o sched_getcpu_test sched_getcpu_test.c && ./sched_getcpu_test ) ; then echo "#define HAVE_SCHED_GETCPU 1" > config.h ; else echo "#define HAVE_SCHED_GETCPU 0" > config.h ; fi
	if ( gcc -o clock_gettime_test clock_gettime_test.c -lrt && ./clock_gettime_test ) ; then echo "#define HAVE_CLOCK_GETTIME 1" >> config.h ; else echo "#define HAVE_CLOCK_GETTIME 0" >> config.h ; fi
	if ( gcc -o hwloc_test hwloc_test.c -lhwloc && ./hwloc_test ) ; then echo "#define HAVE_HWLOC 1" >> config.h ; else echo "#define HAVE_HWLOC 0" >> config.h ; fi
	echo "#define USE_DYNAMIC_ARRAYS 0" >> config.h
        
stream.o: stream.c config.h
	$(CC) -Wundef $(CFLAGS) -c $< -o $@

stream: stream.o
	$(CC) $< -o ../$@ $(LIBS)

clean:
	rm -rf *~
	rm -rf stream.o ../stream config.h sched_getcpu_test clock_gettime_test hwloc_test
