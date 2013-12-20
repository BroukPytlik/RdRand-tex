/*
 * It will wait for semaphore to reach 0
 * ./semwait sem_id
 * gcc -o semwait semwait.c
 * SEM_ID=$(semcreate) 
 * ( semwait ${SEM_ID}; date +%T_%N) &
 * ( semwait ${SEM_ID}; date +%T_%N) &
 * ( semwait ${SEM_ID}; date +%T_%N) &
 * ipcs -s -i ${SEM_ID}
 * semremove ${SEM_ID}
 */

#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/ipc.h>
#include <sys/sem.h>

#ifdef _SEM_SEMUN_UNDEFINED
union semun
{
	int val;                           // value for SETVAL
	struct semid_ds *buf;              // buffer for IPC_STAT & IPC_SET
	unsigned short int *array;         // array for GETALL & SETALL
	struct seminfo *__buf;             // buffer for IPC_INFO
};
#endif

int main(int argc, char *argv[]) {
	int sem_id;
	union semun sem_union;
	struct sembuf sem_b;
	int semval;

	if (argc != 2) {
		fprintf(stderr, "%s sem_id\n", argv[0]);
		exit(1);
	}
	sem_id = atoi(argv[1]);
	/* fprintf(stderr,"sem_id %d\n",sem_id); */

	semval = semctl(sem_id, 0, GETVAL, sem_union);
	if (semval == -1) {
		perror("  semctl");
		exit(1);
	} else if (semval != 1) {
	    fprintf(stderr,"  semval is %d instead of 1!", semval);
	    exit(1);
	}

	sem_b.sem_num = 0; /* semaphore number 0 (we have only one semaphore) */
	sem_b.sem_op = 0;  /* wait for zero */
	sem_b.sem_flg = 0; /* flags can be: IPC_NOWAIT and SEM_UNDO */ 

	if (semop(sem_id, &sem_b, 1) == -1) {
		perror("  semop - wait for 0");
		exit(1);
	}

	return 0;
}
