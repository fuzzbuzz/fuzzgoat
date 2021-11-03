CC=clang
DEPS=main.c fuzzgoat.c
ASAN= #-fsanitize=address
CFLAGS=-I.
LIBS=-lm

all: $(DEPS)
	$(CC) -w -o fuzzgoat $(CFLAGS) $^ $(LIBS)
	$(CC) -w -o fuzzgoat_ASAN $(CFLAGS) $^ $(LIBS)

afl: fuzzgoat
	afl-fuzz -i in -o out ./fuzzgoat @@

.PHONY: clean

clean:
	rm ./fuzzgoat ./fuzzgoat_ASAN
