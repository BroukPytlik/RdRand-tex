/*
 * It will sleep until N_pids are waiting for given semaphore
 * ./semwaitforpids sem_id number_of_pids_waiting_for_this_semaphore
 * gcc -Wall -O2 -o semwaitforpids semwaitforpids.c
 * SEM_ID=$(semcreate) 
 * ( semwait ${SEM_ID}; date +%T_%N) &
 * ( semwait ${SEM_ID}; date +%T_%N) &
 * ( semwait ${SEM_ID}; date +%T_%N) &
 * ipcs -s -i ${SEM_ID}
 * semwaitforpids ${SEM_ID} 3
 */

#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/ipc.h>
#include <sys/sem.h>
#include <unistd.h>

#ifdef _SEM_SEMUN_UNDEFINED
union semun
{
	int val;                           // value for SETVAL
	struct semid_ds *buf;              // buffer for IPC_STAT & IPC_SET
	unsigned short int *array;         // array for GETALL & SETALL
	struct seminfo *__buf;             // buffer for IPC_INFO
};
#endif

/* Make sure that pid_count == semzcnt If not, sleep for (loops_to_wait-1)*loops_to_wait/2 seconds */
int wait_for_all_pids(int sem_id, int pid_count, int loops_to_wait) {
	int semzcnt;
	int counter=0;
	union semun sem_union;

	do {
	    semzcnt = semctl(sem_id, 0, GETZCNT, sem_union);
	    if (semzcnt == -1) {
		    perror("  semctl GETZCNT");
		    semctl (sem_id, 0, IPC_RMID, sem_union);
		    exit(1);
	    } else if ( semzcnt != pid_count) {
		if ( counter < loops_to_wait ) {
		    sleep(counter);
		    ++counter;
		} else {
		    fprintf(stderr,"  Warning! semzcnt is %d instead of expected %d and maximum wait time has been reached!\n", semzcnt, pid_count);
		    return (1);
		}
	    }
	} while ( semzcnt != pid_count );

	return (0);
}

int main(int argc, char *argv[]) {
	int sem_id;
	int pid_count;
	union semun sem_union;
	int semval;
	int return_status;

	if (argc != 3) {
		fprintf(stderr, "%s sem_id number_of_pids_waiting_for_semaphore\n", argv[0]);
		exit(1);
	}
	sem_id = atoi(argv[1]);
	/* fprintf(stderr,"sem_id %d\n",sem_id); */
	pid_count = atoi(argv[2]);
	/* fprintf(stderr,"sem_id %d\n",pid_count); */

	/* Make sure that semaphore exists */
	semval = semctl(sem_id, 0, GETVAL, sem_union);
	if (semval == -1) {
		perror("  semctl GETVAL");
		exit(1);
	} else if (semval != 1) {
	    fprintf(stderr,"  semval is %d instead of 1!", semval);
	    exit(1);
	}

	/* Make sure that pid_count == semzcnt. If not, sleep for (N-1)*N/2 seconds,  n=5=>10 sec */
	return_status = wait_for_all_pids(sem_id, pid_count, 5);

	return (return_status);
}
