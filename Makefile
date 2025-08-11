# Main Makefile for fx68k project

.PHONY: all clean test

all: verilator modelsim

verilator:
	./scripts/build_verilator.sh

modelsim:
	./scripts/build_modelsim.sh

TEST_ARGS ?=
test:
	./scripts/run_tests.sh $(TEST_ARGS)

clean:
	cd sim/verilator && make clean
	rm -rf sim/modelsim/work
