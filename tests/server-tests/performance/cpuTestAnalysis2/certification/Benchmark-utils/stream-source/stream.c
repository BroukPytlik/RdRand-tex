/* jhladky@redhat.com : Added semaphore to synchronize start of multiple programs
 * Usage: ./stream [sem_id] where sem_id is semaphore_id
 * See sem_progs directory
 *
 * SEM_ID=$(semcreate)
 * stream ${SEM_ID} &
 * stream ${SEM_ID} &
 * semwaitforpids ${SEM_ID} 2
 * ipcs -s -i ${SEM_ID}
 * semremove ${SEM_ID} 2
 * 
 * This is to replace the old more complicated way
 * SEM_ID=$(semcreate)
 * ( semwait ${SEM_ID}; stream) &
 * ( semwait ${SEM_ID}; stream) &
 * ipcs -s -i ${SEM_ID}
 * semremove ${SEM_ID} 2
 * 
 * Comments: 
 * semcreate			It will create a semaphore and set to 1
 * stream ${SEM_ID} &		It will block until semaphore is 0
 * semwaitforpids ${SEM_ID} 2	This is to make sure that 2 PIDs are waiting for semaphore to be 0. 
 *				If not, it will sleep for upto 10seconds. This is not absolutly necessary
 *				since semremove is also doing this check. However, it's usefull to collect
 *				some stastics like lstopo --top
 * ipcs -s -i ${SEM_ID}		It will give information about the semaphore. Usefull for debugging.
 * semremove ${SEM_ID} 2	It will check that  2 pids are waiting for semaphore to reach 0
 *						    set semaphore to 0
 *						    delete the semaphore
 * */

/*-----------------------------------------------------------------------*/
/* Program: Stream                                                       */
/* Revision: $Id: stream.c,v 5.4 2005/02/08 03:05:20 mccalpin Exp mccalpin $ */
/* Original code developed by John D. McCalpin                           */
/* Programmers: John D. McCalpin                                         */
/*              Joe R. Zagar                                             */
/*                                                                       */
/* This program measures memory transfer rates in MB/s for simple        */
/* computational kernels coded in C.                                     */
/*-----------------------------------------------------------------------*/
/* Copyright 1991-2005: John D. McCalpin                                 */
/*-----------------------------------------------------------------------*/
/* License:                                                              */
/*  1. You are free to use this program and/or to redistribute           */
/*     this program.                                                     */
/*  2. You are free to modify this program for your own use,             */
/*     including commercial use, subject to the publication              */
/*     restrictions in item 3.                                           */
/*  3. You are free to publish results obtained from running this        */
/*     program, or from works that you derive from this program,         */
/*     with the following limitations:                                   */
/*     3a. In order to be referred to as "STREAM benchmark results",     */
/*         published results must be in conformance to the STREAM        */
/*         Run Rules, (briefly reviewed below) published at              */
/*         http://www.cs.virginia.edu/stream/ref.html                    */
/*         and incorporated herein by reference.                         */
/*         As the copyright holder, John McCalpin retains the            */
/*         right to determine conformity with the Run Rules.             */
/*     3b. Results based on modified source code or on runs not in       */
/*         accordance with the STREAM Run Rules must be clearly          */
/*         labelled whenever they are published.  Examples of            */
/*         proper labelling include:                                     */
/*         "tuned STREAM benchmark results"                              */
/*         "based on a variant of the STREAM benchmark code"             */
/*         Other comparable, clear and reasonable labelling is           */
/*         acceptable.                                                   */
/*     3c. Submission of results to the STREAM benchmark web site        */
/*         is encouraged, but not required.                              */
/*  4. Use of this program or creation of derived works based on this    */
/*     program constitutes acceptance of these licensing restrictions.   */
/*  5. Absolutely no warranty is expressed or implied.                   */
/*-----------------------------------------------------------------------*/
# include <stdio.h>
# include <stdlib.h>
# include <math.h>
# include <float.h>
# include <limits.h>
# include <time.h>
# include <sys/time.h>

/* jhladky@redhat.com : define HAVE_SCHED_GETCPU */
# include "config.h"

/* jhladky@redhat.com : Added semaphore to synchronize start of multiple programs */
# include <sys/types.h>
# include <sys/ipc.h>
# include <sys/sem.h>
/* jhladky@redhat.com : getrusage */
#include <sys/resource.h>
/* jhladky@redhat.com : hwloc */
#if HAVE_HWLOC==1
#include <hwloc.h>
#endif
/* jhladky@redhat.com : uname */
#include <sys/utsname.h>
/* jhladky@redhat.com : sched_getcpu - determine CPU on which the calling thread is running */
#if HAVE_SCHED_GETCPU==1
#define _GNU_SOURCE
#include <utmpx.h>
#include <sched.h>
#endif



#ifdef _SEM_SEMUN_UNDEFINED
union semun
{
	int val;                           // value for SETVAL
	struct semid_ds *buf;              // buffer for IPC_STAT & IPC_SET
	unsigned short int *array;         // array for GETALL & SETALL
	struct seminfo *__buf;             // buffer for IPC_INFO
};
#endif

/* jhladky@redhat.com : END */

/* INSTRUCTIONS:
 *
 *	1) Stream requires a good bit of memory to run.  Adjust the
 *          value of 'N' (below) to give a 'timing calibration' of 
 *          at least 20 clock-ticks.  This will provide rate estimates
 *          that should be good to about 5% precision.
 */

# define N	10000000
# define NTIMES	120
/* jhladky@redhat.com : skip first and last few iterations. 
 * Original settings were N=50
 * FIRST=1 (FIRST was not used, it was hard-coded in the loop to compute statistics)
 * LAST=0  (LAST was not used, it was hard-coded in the loop to compute statistics)
 * 10 iterations takes ~ 2 seconds of runtime
 */
# define FIRST 11
# define LAST 60

# define OFFSET	0

/*
 *	3) Compile the code with full optimization.  Many compilers
 *	   generate unreasonably bad code before the optimizer tightens
 *	   things up.  If the results are unreasonably good, on the
 *	   other hand, the optimizer might be too smart for me!
 *
 *         Try compiling with:
 *               cc -O stream_omp.c -o stream_omp
 *
 *         This is known to work on Cray, SGI, IBM, and Sun machines.
 *
 *
 *	4) Mail the results to mccalpin@cs.virginia.edu
 *	   Be sure to include:
 *		a) computer hardware model number and software revision
 *		b) the compiler flags
 *		c) all of the output from the test case.
 * Thanks!
 *
 */

# define HLINE "-------------------------------------------------------------\n"

# ifndef MIN
# define MIN(x,y) ((x)<(y)?(x):(y))
# endif
# ifndef MAX
# define MAX(x,y) ((x)>(y)?(x):(y))
# endif

/* jhladky@redhat.com: Added possibility to allocate arrays on the heap (using dynamic arrays)
 * Controlled by preprocessor variable USE_DYNAMIC_ARRAYS defined in config.h which is generated by Makefile
 * Original stream benchmark is using static arrays allocated on the stack
 * Current default (coded in Makefile) is to use static arrays ( USE_DYNAMIC_ARRAYS is 0)
*/
#if USE_DYNAMIC_ARRAYS == 0
static double	a[N+OFFSET],
		b[N+OFFSET],
		c[N+OFFSET];
#else
static double *a, *b, *c;
#endif
/* jhladky@redhat.com END */

static double	avgtime[4] = {0}, maxtime[4] = {0},
		mintime[4] = {FLT_MAX,FLT_MAX,FLT_MAX,FLT_MAX};

/* jhladky@redhat.com: ALL statistics */
static double all_avgtime=0, all_mintime=FLT_MAX, all_maxtime=0, all_bytes=0, all_time;
/* jhladky@redhat.com END */

static char	*label[4] = {"Copy:      ", "Scale:     ",
    "Add:       ", "Triad:     "};

static double	bytes[4] = {
    2 * sizeof(double) * N,
    2 * sizeof(double) * N,
    3 * sizeof(double) * N,
    3 * sizeof(double) * N
    };

extern double mysecond();
extern void checkSTREAMresults();
#ifdef TUNED
extern void tuned_STREAM_Copy();
extern void tuned_STREAM_Scale(double scalar);
extern void tuned_STREAM_Add();
extern void tuned_STREAM_Triad(double scalar);
#endif
int
main(int argc, char *argv[])
    {
    int			quantum, checktick();
    int			BytesPerWord;
    register int	j, k;
    double		scalar, t, times[4][NTIMES];

    /* jhladky@redhat.com :  uname */
    struct utsname uname_buf;
    if(uname(&uname_buf) == -1)
        printf("uname call failed!");
    else {
        printf("Nodename:\t%s\n", uname_buf.nodename);
	printf("Sysname:\t%s\n", uname_buf.sysname);
        printf("Release:\t%s\n", uname_buf.release);
        printf("Version:\t%s\n", uname_buf.version);
        printf("Machine:\t%s\n", uname_buf.machine);
   }
     
/* jhladky@redhat.com : Added semaphore to synchronize start of multiple programs */
    int sem_id;	    /* semaphore id */
    union semun sem_union;
    struct sembuf sem_b;
    int semval;
    struct timeval start, end;
    time_t curtime;
    char buffer[30];
    double time_difference;
/* jhladky@redhat.com : getrusage */
    int who = RUSAGE_SELF;
    struct rusage usage[2];
    int ret;
    long value_difference;
/* jhladky@redhat.com : sched_getcpu - determine CPU on which the calling thread is running */
#if HAVE_SCHED_GETCPU==1
    int cpu[NTIMES];
    printf(HLINE);
    printf("Started on CPU %d.\n", sched_getcpu() );
#endif
 
/* jhladky@redhat.com: Added possibility to allocate arrays on the heap (using dynamic arrays) */
#if USE_DYNAMIC_ARRAYS != 0
    a = malloc( 3*(N+OFFSET)* sizeof (double));
    if (a == NULL) {
	perror("Malloc - cannot allocate the requested memory. Quiting.\n");
    }
    b = a + N+OFFSET;
    c = b + N+OFFSET;

#if HAVE_SCHED_GETCPU==1
    printf("After malloc program is running on CPU %d.\n", sched_getcpu() );
#endif

#endif
/* jhladky@redhat.com : END */



    if (argc == 2) {
	sem_id = atoi(argv[1]);
	/* fprintf(stderr,"sem_id %d\n",sem_id); */

	semval = semctl(sem_id, 0, GETVAL, sem_union);
	if (semval == -1) {
	    fprintf(stderr, "  Usage: %s [semaphore_id]\n", argv[0]);
	    fprintf(stderr, "  semaphore_id %d does not seem to be valid.\n", sem_id);
	    perror("  semctl");
	    exit(1);
	} else if (semval != 1) {
	    fprintf(stderr, "  Value of semaphore_id %d is %d instead of 1!", sem_id, semval);
	    exit(1);
	}

	sem_b.sem_num = 0; /* semaphore number 0 (we have only one semaphore) */
	sem_b.sem_op = 0;  /* wait for zero */
	sem_b.sem_flg = 0; /* flags can be: IPC_NOWAIT and SEM_UNDO */ 

	printf("Waiting for semaphore_id %d to reach 0.\n", sem_id);
	if (semop(sem_id, &sem_b, 1) == -1) {
	    fprintf(stderr, "  Error occured when waiting for semaphore_id %d to reach 0.\n", sem_id);
	    perror("  semop - wait for 0");
	}
    }

    gettimeofday(&start, NULL); 
    ret = getrusage(who, &usage[0]);
    if ( ret == -1) {
	perror("Error calling getrusage.\n");
	exit(1);
    }
    curtime=start.tv_sec;
    strftime(buffer,30,"%m-%d-%Y  %T.",localtime(&curtime));
    printf("Started at %s%06ld\n",buffer,start.tv_usec);

/* jhladky@redhat.com : END */

    /* --- SETUP --- determine precision and check timing --- */

    printf(HLINE);
    BytesPerWord = sizeof(double);
    printf("This system uses %d bytes per DOUBLE PRECISION word.\n",
	BytesPerWord);

    printf(HLINE);
    printf("Array size = %d, Offset = %d\n" , N, OFFSET);
    printf("Total memory required = %.1f MB.\n",
	(3.0 * BytesPerWord) * ( (double) N / 1048576.0));
    printf("Each test is run %d times, but only\n", NTIMES);
    printf("the *best* time for each is used.\n");
    printf("First %d iterations are not considered.\n", FIRST);
    printf("Last %d iterations are not considered.\n", LAST);

#ifdef _OPENMP
    printf(HLINE);
#pragma omp parallel private(k)
    {
    k = omp_get_num_threads();
    printf ("Number of Threads requested = %i\n",k);
    }
#endif

    /* Get initial value for system clock. */
#pragma omp parallel for
    for (j=0; j<N; j++) {
	a[j] = 1.0;
	b[j] = 2.0;
	c[j] = 0.0;
	}

    printf(HLINE);

    if  ( (quantum = checktick()) >= 1) 
	printf("Your clock granularity/precision appears to be "
	    "%d microseconds.\n", quantum);
    else
	printf("Your clock granularity appears to be "
	    "less than one microsecond.\n");

    t = mysecond();
#pragma omp parallel for
    for (j = 0; j < N; j++)
	a[j] = 2.0E0 * a[j];
    t = 1.0E6 * (mysecond() - t);

    printf("Each test below will take on the order"
	" of %d microseconds.\n", (int) t  );
    printf("   (= %d clock ticks)\n", (int) (t/quantum) );
    printf("Increase the size of the arrays if this shows that\n");
    printf("you are not getting at least 20 clock ticks per test.\n");

    printf(HLINE);

    printf("WARNING -- The above is only a rough guideline.\n");
    printf("For best results, please be sure you know the\n");
    printf("precision of your system timer.\n");
    printf(HLINE);
    
    /*	--- MAIN LOOP --- repeat test cases NTIMES times --- */

    scalar = 3.0;
    for (k=0; k<NTIMES; k++)
	{
#if HAVE_SCHED_GETCPU==1
	cpu[k] = sched_getcpu();    
#endif  
	times[0][k] = mysecond();
#ifdef TUNED
        tuned_STREAM_Copy();
#else
#pragma omp parallel for
	for (j=0; j<N; j++)
	    c[j] = a[j];
#endif
	times[0][k] = mysecond() - times[0][k];
	
	times[1][k] = mysecond();
#ifdef TUNED
        tuned_STREAM_Scale(scalar);
#else
#pragma omp parallel for
	for (j=0; j<N; j++)
	    b[j] = scalar*c[j];
#endif
	times[1][k] = mysecond() - times[1][k];
	
	times[2][k] = mysecond();
#ifdef TUNED
        tuned_STREAM_Add();
#else
#pragma omp parallel for
	for (j=0; j<N; j++)
	    c[j] = a[j]+b[j];
#endif
	times[2][k] = mysecond() - times[2][k];
	
	times[3][k] = mysecond();
#ifdef TUNED
        tuned_STREAM_Triad(scalar);
#else
#pragma omp parallel for
	for (j=0; j<N; j++)
	    a[j] = b[j]+scalar*c[j];
#endif
	times[3][k] = mysecond() - times[3][k];
	}

    /*	--- SUMMARY --- */

    for (k=FIRST; k<NTIMES-LAST; k++) /* note -- skip FIRST and LAST iterations */
	{
	for (j=0; j<4; j++)
	    {
	    avgtime[j] = avgtime[j] + times[j][k];
	    mintime[j] = MIN(mintime[j], times[j][k]);
	    maxtime[j] = MAX(maxtime[j], times[j][k]);
	    }
	}
    
    printf("Function      Rate (MB/s)   Avg time     Min time     Max time\n");
    for (j=0; j<4; j++) {
	avgtime[j] = avgtime[j]/(double)(NTIMES-FIRST-LAST);

	printf("%s%11.4f  %11.4f  %11.4f  %11.4f\n", label[j],
	       1.0E-06 * bytes[j]/mintime[j],
	       avgtime[j],
	       mintime[j],
	       maxtime[j]);
    }
    /* jhladky@redhat.com : ALL statistics
     * Since stream is taking best value as the result I'm going to use best value for ALL statistics (all tests)
       for (j=0; j<4; j++) {
         all_time[k] += times[j][k];
       }
       ALL RATE = all_bytes / min {all_time[k], over all k}
       ALL AVG TIME = sum {all_time[k], over all k} / k
       ALL MIN TIME = min {all_time[k], over all k}
       ALL MAX TIME = max {all_time[k], over all k}}
     */
    for (j=0; j<4; j++) {
	all_avgtime += avgtime[j];
	all_bytes += bytes[j];
    }

    for (k=FIRST; k<NTIMES-LAST; k++)  { /* note -- skip FIRST and LAST iterations */
	all_time = 0; /* total runtime for all tests for k-th iteration*/
	for (j=0; j<4; j++) {
	    all_time += times[j][k];
	}
	all_mintime = MIN(all_mintime, all_time);
	all_maxtime = MAX(all_maxtime, all_time);
    }

    printf("%s%11.4f  %11.4f  %11.4f  %11.4f\n", "ALL:       ", 
	    1.0E-06 * all_bytes/all_mintime,
	    all_avgtime,
	    all_mintime,
	    all_maxtime);
   /* jhladky@redhat.com END */

    printf(HLINE);

    /* --- Check Results --- */
    checkSTREAMresults ();
    printf(HLINE);

    /* jhladky@redhat.com : Time information */
    gettimeofday(&end, NULL); 
    ret = getrusage(who, &usage[1]);
    if ( ret == -1) {
	perror("Error calling getrusage.\n");
	exit(1);
    }

    curtime=end.tv_sec;
    strftime(buffer,30,"%m-%d-%Y  %T.",localtime(&curtime));
    printf("Finished at %s%06ld\n",buffer,end.tv_usec);

    time_difference = (double)(end.tv_sec - start.tv_sec) + (double)(end.tv_usec - start.tv_usec)/1000000.0;
    printf("Time elapsed:\t%#.3f seconds\n", time_difference);

    time_difference = (double)(usage[1].ru_utime.tv_sec - usage[0].ru_utime.tv_sec) + (double)(usage[1].ru_utime.tv_usec - usage[0].ru_utime.tv_usec)/1000000.0;
    printf("User time:\t%#.3f seconds\n", time_difference);
    
    time_difference = (double)(usage[1].ru_stime.tv_sec - usage[0].ru_stime.tv_sec) + (double)(usage[1].ru_stime.tv_usec - usage[0].ru_stime.tv_usec)/1000000.0;
    printf("System time:\t%#.3f seconds\n", time_difference);

    printf(HLINE);

    value_difference = usage[1].ru_minflt - usage[0].ru_minflt;
    printf("Page reclaims:\t%ld\n", value_difference);

    value_difference = usage[1].ru_majflt - usage[0].ru_majflt;
    printf("Page faults:\t%ld\n", value_difference);

    value_difference = usage[1].ru_nvcsw - usage[0].ru_nvcsw;
    printf("Voluntary context switches:\t%ld\n", value_difference);
    
    value_difference = usage[1].ru_nivcsw - usage[0].ru_nivcsw;
    printf("Involuntary context switches:\t%ld\n", value_difference);

    /* jhladky@redhat.com : sched_getcpu - print out list of CPUs on which the program was running */
#if HAVE_SCHED_GETCPU==1
    printf(HLINE);
    printf("PUs, ABSOLUTE_COREs, RELATIVE_COREs (CORE number inside SOCKET), SOCKETs and NUMA nodes on which %s was running.\n",argv[0]);
    printf("ABSOLUTE_COREs represent logical numbering of COREs. It's horizontal index in the whole list of COREs.\n"); 
    printf("-1 means that the object could not be identified.\n");
    printf(HLINE);
    printf("%-16s", "PUs: ");
    for (k=0; k<NTIMES; k++)
	{
	    printf("%d ",cpu[k]);
	}
    printf("\n");

/* jhladky@redhat.com : hwloc */
#if HAVE_HWLOC==1

hwloc_topology_t topology;
hwloc_obj_t obj[4];
int pu_hier[5][4*NTIMES];  //First index PU, CORE inside SOCKET, SOCKET, NUMA_NODE, logical numbering of COREs (horizontal index in the whole list of COREs)

ret = hwloc_topology_init(&topology);
if ( ret == -1) {
	perror("Error calling hwloc_topology_init.\n");
	exit(1);
}

ret = hwloc_topology_load(topology);
if ( ret == -1) {
	perror("Error calling hwloc_topology_load.\n");
	exit(1);
}

for (k=0; k< NTIMES; k++) {
  pu_hier[0][k]= cpu[k];
  pu_hier[1][k]= -1;
  pu_hier[2][k]= -1;
  pu_hier[3][k]= -1;
  pu_hier[4][k]= -1;

  obj[0] = hwloc_get_pu_obj_by_os_index(topology, pu_hier[0][k]);
  if ( obj[0] ) {
    obj[1] = hwloc_get_ancestor_obj_by_type (topology, HWLOC_OBJ_CORE, obj[0]);
    obj[2] = hwloc_get_ancestor_obj_by_type (topology, HWLOC_OBJ_SOCKET, obj[0]);
    obj[3] = hwloc_get_ancestor_obj_by_type (topology, HWLOC_OBJ_NODE, obj[0]);
    if ( obj[1] ) {
      pu_hier[1][k]=obj[1]->os_index;           //Core # relative to socket
      pu_hier[4][k] = obj[1]->logical_index;    //Absolute core # - horizontal index in the whole list of COREs 
    }
    if ( obj[2] ) pu_hier[2][k]=obj[2]->os_index; 	
    if ( obj[3] ) pu_hier[3][k]=obj[3]->os_index;
  }
}
printf("%-16s", "ABSOLUTE_COREs: ");
for (k=0; k< NTIMES; k++) {
  printf("%d ",pu_hier[4][k]);
}
printf("\n");

printf("%-16s", "RELATIVE_COREs: ");
for (k=0; k< NTIMES; k++) {
  printf("%d ",pu_hier[1][k]);
}
printf("\n");

printf("%-16s", "SOCKETs: ");
for (k=0; k< NTIMES; k++) {
  printf("%d ",pu_hier[2][k]);
}
printf("\n");

printf("%-16s","NUMA nodes: ");
for (k=0; k< NTIMES; k++) {
  printf("%d ",pu_hier[3][k]);
}
printf("\n");

#endif

#endif

    /* jhladky@redhat.com: Added possibility to allocate arrays on the heap (using dynamic arrays) */
#if USE_DYNAMIC_ARRAYS != 0
    free(a);
    a = NULL;
    b = NULL;
    c = NULL;
#endif

    /* jhladky@redhat.com : END */

    return 0;
}

# define	M	20

int
checktick()
    {
    int		i, minDelta, Delta;
    double	t1, t2, timesfound[M];

/*  Collect a sequence of M unique time values from the system. */

    for (i = 0; i < M; i++) {
	t1 = mysecond();
	while( ((t2=mysecond()) - t1) < 1.0E-6 )
	    ;
	timesfound[i] = t1 = t2;
	}

/*
 * Determine the minimum difference between these M values.
 * This result will be our estimate (in microseconds) for the
 * clock granularity.
 */

    minDelta = 1000000;
    for (i = 1; i < M; i++) {
	Delta = (int)( 1.0E6 * (timesfound[i]-timesfound[i-1]));
	minDelta = MIN(minDelta, MAX(Delta,0));
	}

   return(minDelta);
    }


/* jhladky@redhat.com : clock_gettime Link with -lrt */
#if HAVE_CLOCK_GETTIME==1

#include <time.h>
double mysecond()
{
        static struct timespec tp;
        clock_gettime(CLOCK_MONOTONIC, &tp);
        return ( (double) tp.tv_sec + (double) tp.tv_nsec * 1.e-9 );
}

#else
/* A gettimeofday routine to give access to the wall
   clock timer on most UNIX-like systems.  */

#include <sys/time.h>
double mysecond()
{
        struct timeval tp;
        struct timezone tzp;
        int i;

        i = gettimeofday(&tp,&tzp);
        return ( (double) tp.tv_sec + (double) tp.tv_usec * 1.e-6 );
}
#endif

void checkSTREAMresults ()
{
	double aj,bj,cj,scalar;
	double asum,bsum,csum;
	double epsilon;
	int	j,k;

    /* reproduce initialization */
	aj = 1.0;
	bj = 2.0;
	cj = 0.0;
    /* a[] is modified during timing check */
	aj = 2.0E0 * aj;
    /* now execute timing loop */
	scalar = 3.0;
	for (k=0; k<NTIMES; k++)
        {
            cj = aj;
            bj = scalar*cj;
            cj = aj+bj;
            aj = bj+scalar*cj;
        }
	aj = aj * (double) (N);
	bj = bj * (double) (N);
	cj = cj * (double) (N);

	asum = 0.0;
	bsum = 0.0;
	csum = 0.0;
	for (j=0; j<N; j++) {
		asum += a[j];
		bsum += b[j];
		csum += c[j];
	}
#ifdef VERBOSE
	printf ("Results Comparison: \n");
	printf ("        Expected  : %f %f %f \n",aj,bj,cj);
	printf ("        Observed  : %f %f %f \n",asum,bsum,csum);
#endif

#define abs(a) ((a) >= 0 ? (a) : -(a))
	epsilon = 1.e-8;

	if (abs(aj-asum)/asum > epsilon) {
		printf ("Failed Validation on array a[]\n");
		printf ("        Expected  : %f \n",aj);
		printf ("        Observed  : %f \n",asum);
	}
	else if (abs(bj-bsum)/bsum > epsilon) {
		printf ("Failed Validation on array b[]\n");
		printf ("        Expected  : %f \n",bj);
		printf ("        Observed  : %f \n",bsum);
	}
	else if (abs(cj-csum)/csum > epsilon) {
		printf ("Failed Validation on array c[]\n");
		printf ("        Expected  : %f \n",cj);
		printf ("        Observed  : %f \n",csum);
	}
	else {
		printf ("Solution Validates\n");
	}
}

void tuned_STREAM_Copy()
{
	int j;
#pragma omp parallel for
        for (j=0; j<N; j++)
            c[j] = a[j];
}

void tuned_STREAM_Scale(double scalar)
{
	int j;
#pragma omp parallel for
	for (j=0; j<N; j++)
	    b[j] = scalar*c[j];
}

void tuned_STREAM_Add()
{
	int j;
#pragma omp parallel for
	for (j=0; j<N; j++)
	    c[j] = a[j]+b[j];
}

void tuned_STREAM_Triad(double scalar)
{
	int j;
#pragma omp parallel for
	for (j=0; j<N; j++)
	    a[j] = b[j]+scalar*c[j];
}
