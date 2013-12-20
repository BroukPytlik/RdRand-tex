CFLAGS=-O2
BINS = semcreate semwait semwaitforpids semremove
SOURCES = $(addsuffix .c, $(BINS))

all:	$(BINS)

%:	%.c
	$(CC) -Wall -Wundef $(CFLAGS) $< -o ../$@


