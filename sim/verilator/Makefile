# Verilator Makefile for fx68k CPU tests
# This Makefile provides targets for building and running various testbenches

# Configuration
VERILATOR = verilator
VERILATOR_FLAGS = -Wall -Wno-fatal --cc --exe --build --trace --Wno-lint -y $(ROOT_DIR)/rtl --Wno-BLKANDNBLK --Wno-MULTIDRIVEN --Wno-INITIALDLY --Wno-UNOPTFLAT
VERILATOR_TRACE_FLAGS = --trace
VERILATOR_OPT_FLAGS = -O3
VERILATOR_DEBUG_FLAGS = -g -O0

ROOT_DIR = ../../

# Source files
RTL_SOURCES = fx68k.sv fx68kAlu.sv uaddrPla.sv
TEST_SOURCES = tb_fx68k.cpp test_alu.cpp test_instructions.cpp test_memory.cpp test_interrupt.cpp test_timing.cpp

# Default target
all: build

# Build all testbenches
build: build_main build_alu build_instructions build_memory build_interrupt build_timing

# Build main testbench
build_main:
	+$(VERILATOR) $(VERILATOR_FLAGS) $(VERILATOR_OPT_FLAGS) \
		--top-module fx68k \
		$(RTL_SOURCES) \
		tb_fx68k.cpp \
		-o fx68k_main_test

# Build ALU testbench
build_alu:
	+$(VERILATOR) $(VERILATOR_FLAGS) $(VERILATOR_OPT_FLAGS) \
		--top-module fx68kAlu \
		$(ROOT_DIR)/rtl/fx68kAlu.sv \
		test_alu.cpp \
		-o fx68k_alu_test

# Build instruction testbench
build_instructions:
	+$(VERILATOR) $(VERILATOR_FLAGS) $(VERILATOR_OPT_FLAGS) \
		--top-module fx68k \
		$(RTL_SOURCES) \
		test_instructions.cpp \
		-o fx68k_instruction_test

# Build memory testbench
build_memory:
	+$(VERILATOR) $(VERILATOR_FLAGS) $(VERILATOR_OPT_FLAGS) \
		--top-module fx68k \
		$(RTL_SOURCES) \
		test_memory.cpp \
		-o fx68k_memory_test

# Build interrupt testbench
build_interrupt:
	+$(VERILATOR) $(VERILATOR_FLAGS) $(VERILATOR_OPT_FLAGS) \
		--top-module fx68k \
		$(RTL_SOURCES) \
		test_interrupt.cpp \
		-o fx68k_interrupt_test

# Build timing testbench
build_timing:

	+$(VERILATOR) $(VERILATOR_FLAGS) $(VERILATOR_OPT_FLAGS) \
		--top-module fx68k \
		$(RTL_SOURCES) \
		test_timing.cpp \
		-o fx68k_timing_test

# Build with tracing enabled
build_trace: VERILATOR_FLAGS += $(VERILATOR_TRACE_FLAGS)
build_trace: build

# Build with debug symbols
build_debug: VERILATOR_FLAGS += $(VERILATOR_DEBUG_FLAGS)
build_debug: build

# Build with both trace and debug
build_trace_debug: VERILATOR_FLAGS += $(VERILATOR_TRACE_FLAGS) $(VERILATOR_DEBUG_FLAGS)
build_trace_debug: build

# Run all tests
test: test_main test_alu test_instructions test_memory test_interrupt test_timing

# Run main testbench
test_main: build_main
	./obj_dir/fx68k_main_test

# Run ALU testbench
test_alu: build_alu
	./obj_dir/fx68k_alu_test

# Run instruction testbench
test_instructions: build_instructions
	./obj_dir/fx68k_instruction_test

# Run memory testbench
test_memory: build_memory
	./obj_dir/fx68k_memory_test

# Run interrupt testbench
test_interrupt: build_interrupt
	./obj_dir/fx68k_interrupt_test

# Run timing testbench
test_timing: build_timing
	./obj_dir/fx68k_timing_test

# Run tests with tracing
test_trace: build_trace
	./obj_dir/fx68k_main_test --trace
	./obj_dir/fx68k_alu_test --trace
	./obj_dir/fx68k_instruction_test --trace
	./obj_dir/fx68k_memory_test --trace
	./obj_dir/fx68k_interrupt_test --trace
	./obj_dir/fx68k_timing_test --trace

# Run tests with performance monitoring
test_performance: build
	./obj_dir/fx68k_main_test --performance
	./obj_dir/fx68k_alu_test
	./obj_dir/fx68k_instruction_test

# Run specific test categories
test_alu_only: build_alu
	./obj_dir/fx68k_alu_test

test_instructions_only: build_instructions
	./obj_dir/fx68k_instruction_test

test_memory_only: build_memory
	./obj_dir/fx68k_memory_test

test_interrupt_only: build_interrupt
	./obj_dir/fx68k_interrupt_test

test_timing_only: build_timing
	./obj_dir/fx68k_timing_test

# Clean build artifacts
clean:
	rm -rf obj_dir
	rm -f *.vcd
	rm -f *.log
	rm -f fx68k_*_test

# Clean everything including generated files
distclean: clean
	rm -f *.mk
	rm -f *.cpp
	rm -f *.h

# Show help
help:
	@echo "Available targets:"
	@echo "  build              - Build all testbenches"
	@echo "  build_main         - Build main testbench only"
	@echo "  build_alu          - Build ALU testbench only"
	@echo "  build_instructions - Build instruction testbench only"
	@echo "  build_memory       - Build memory testbench only"
	@echo "  build_interrupt    - Build interrupt testbench only"
	@echo "  build_timing       - Build timing testbench only"
	@echo "  build_trace        - Build with tracing enabled"
	@echo "  build_debug        - Build with debug symbols"
	@echo "  build_trace_debug  - Build with both trace and debug"
	@echo ""
	@echo "  test               - Run all tests"
	@echo "  test_main          - Run main testbench only"
	@echo "  test_alu           - Run ALU testbench only"
	@echo "  test_instructions  - Run instruction testbench only"
	@echo "  test_memory        - Run memory testbench only"
	@echo "  test_interrupt     - Run interrupt testbench only"
	@echo "  test_timing        - Run timing testbench only"
	@echo "  test_trace         - Run all tests with tracing"
	@echo "  test_performance   - Run tests with performance monitoring"
	@echo ""
	@echo "  clean              - Clean build artifacts"
	@echo "  distclean          - Clean everything"
	@echo "  help               - Show this help message"
	@echo ""
	@echo "Usage examples:"
	@echo "  make build_trace           # Build with tracing"
	@echo "  make test_alu_only         # Run only ALU tests"
	@echo "  make test_memory_only      # Run only memory tests"
	@echo "  make test_interrupt_only   # Run only interrupt tests"
	@echo "  make test_timing_only      # Run only timing tests"
	@echo "  make test_trace            # Run all tests with tracing"
	@echo "  make clean                 # Clean build files"

# Phony targets
.PHONY: all build build_main build_alu build_instructions build_trace build_debug build_trace_debug
.PHONY: test test_main test_alu test_instructions test_trace test_performance
.PHONY: test_alu_only test_instructions_only clean distclean help

# Default target
.DEFAULT_GOAL := all
