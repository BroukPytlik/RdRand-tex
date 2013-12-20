#define _GNU_SOURCE
#include <utmpx.h>
#include <sched.h>


int main(void) {
    int r = sched_getcpu();
    if ( r == -1 ) {
	return 1;
    } else {
	return 0;
    }
}

