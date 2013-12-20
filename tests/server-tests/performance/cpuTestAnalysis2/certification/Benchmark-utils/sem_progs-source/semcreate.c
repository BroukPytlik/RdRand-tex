/*
 * It will create semaphore with value set to 1
 * On sucess, sem_id is returned
 * gcc -o semcreate semcreate.c
 * ./semcreate; ipcs -s
 */

#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/ipc.h>
#include <sys/sem.h>
#include <time.h>

#ifdef _SEM_SEMUN_UNDEFINED
union semun
{
        int val;                           // value for SETVAL
        struct semid_ds *buf;              // buffer for IPC_STAT & IPC_SET
        unsigned short int *array;         // array for GETALL & SETALL
        struct seminfo *__buf;             // buffer for IPC_INFO
};
#endif

key_t createKey(void)
{
	srandom( time( NULL ) );
	return random();
}

int main(void) {
	int sem_id = -1;
	key_t key;
	union semun sem_union;
	sem_union.val = 1;
	int counter = 0;

	while ( sem_id == -1)
	{
	    key = createKey();
	    sem_id = semget(key, 1, 0666 | IPC_CREAT | IPC_EXCL);
	    if (counter > 5 ) {
		perror("  semget");
		exit(1);
	    }
	    ++counter;
	}

	if (semctl(sem_id, 0, SETVAL, sem_union) == -1) {
		perror("  semctl SETVAL to 1");
		semctl (sem_id, 0, IPC_RMID, sem_union);
		exit(1);
	}

	printf( "%d\n", sem_id);
	/* fprintf(stderr,"%d\n",semctl(sem_id, 0, GETVAL, sem_union)); */
	return 0;
}
