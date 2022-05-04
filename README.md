Fuzzgoat: A minimal libFuzzer integration
===================

This repository contains a basic C project that includes an (intentionally insecure) JSON parser. It is an example of an ideal libFuzzer integration with Fuzzbuzz. It contains:

1) The parser itself. This can be built with `make`, and produces a binary that consumes and parses JSON files

2) A fuzz test, which can be built with `make fuzzer`. The actual test sits inside the `LLVMFuzzerTestOneInput` function, and is built according to the libFuzzer documentation: https://llvm.org/docs/LibFuzzer.html (you might need to run `CC=clang make fuzzer` to build it on your local machine)

3) A `fuzzbuzz.yaml` file, which tells Fuzzbuzz how to build the fuzzers, and configures the bug classes to look for


## Requirements

Fuzzbuzz injects its own flags into code at compile time, which allows us to control the type of feedback we receive from your code. It also enables code coverage reporting and more detailed bug categorization. Your software and build system should be set up to properly work with these flags:

- `$CC` and `$CXX`: Fuzzbuzz provides these environment variables when building. We recommend that you accept overrides to whatever default compiler you use via the environment

- `$CFLAGS` and `$CXXFLAGS`: Fuzzbuzz provides these environment variables when building. Your program _must_ append these flags provided by the environment to its own flags. Features like code coverage reporting will not work unless these flags are properly consumed

The `fuzzer` rule in the Makefile is a good example of how to include these flags in your fuzzer's compile steps.

## WARNING

This C program has been deliberately backdoored with several memory corruption bugs to test the efficacy of fuzzers and other analysis tools. Each vulnerability is clearly commented in fuzzgoat.c. Under input-files/ are files to trigger each vulnerability.

CAUTION: Do not copy any of this code - there is evil stuff in this repo.

Thank You
---------
Contributor: Joseph Carlos 

Fuzzgoat was adapted from FuzzStati0n/fuzzgoat, which itself came from udp/json-parser - we chose it because:

* Its not too big or cumbersome - ~1200 lines of C yet lots of paths for a fuzzer to dig into.
* Performance: its very fast at ~1500 execs per sec per core.
* The code is clean and very readable.

Fuzzbuzz would like to thank Fuzz Stati0n, and the creators and maintainers of udp/json-parser.
