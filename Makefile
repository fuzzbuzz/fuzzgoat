DEPS=fuzzgoat.c main.c
LIBS=-lm

all: $(DEPS)
	$(CC) -w -I. -o fuzzgoat $(CFLAGS) $^ $(LIBS)

fuzzer: $(DEPS)
	$(CC) -w   -o parse-json-fuzzer -fsanitize=fuzzer-no-link -pthread -DFUZZING $(CFLAGS) $(LIB_FUZZING_ENGINE) $^ $(LIBS)

.PHONY: clean

clean:
	rm -f ./fuzzgoat ./parse-json-fuzzer
