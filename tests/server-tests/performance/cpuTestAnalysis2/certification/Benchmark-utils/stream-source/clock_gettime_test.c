#include <time.h>

int main(void) {
    struct timespec tp;
    int r = clock_gettime(CLOCK_MONOTONIC, &tp);

    if ( r == -1 ) {
	return 1;
    } else {
	return 0;
    }
}

