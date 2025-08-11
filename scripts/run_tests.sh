#!/bin/bash

# fx68k CPU Test Runner Script
# This script provides a unified interface for running all CPU tests

# Configuration
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
VERILATOR_DIR="$PROJECT_ROOT/sim/verilator"
MODELSIM_DIR="$PROJECT_ROOT/sim/modelsim"
COMMON_DIR="$PROJECT_ROOT/sim/common"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Test configuration
ENABLE_TRACE=false
ENABLE_PERFORMANCE=false
BUILD_TYPE="release"
TEST_MODE="all"
VERBOSE=false
CLEAN_BUILD=false

# Function to print colored output
print_status() {
    local color=$1
    local message=$2
    echo -e "${color}[$(date '+%H:%M:%S')]${NC} $message"
}

# Function to print help
print_help() {
    echo "fx68k CPU Test Runner"
    echo "====================="
    echo ""
    echo "Usage: $0 [OPTIONS]"
    echo ""
    echo "Options:"
    echo "  -h, --help              Show this help message"
    echo "  -t, --trace             Enable waveform tracing"
    echo "  -p, --performance       Enable performance monitoring"
    echo "  -b, --build-type TYPE   Build type: release, debug, or trace"
    echo "  -m, --test-mode MODE    Test mode: all, alu, instructions, or main"
    echo "  -v, --verbose           Enable verbose output"
    echo "  -c, --clean             Clean build before running tests"
    echo "  --verilator-only        Run only Verilator tests"
    echo "  --modelsim-only         Run only ModelSim tests"
    echo ""
    echo "Test Modes:"
    echo "  all           - Run all tests (default)"
    echo "  alu           - Run only ALU tests"
    echo "  instructions  - Run only instruction tests"
    echo "  memory        - Run only memory tests"
    echo "  interrupt     - Run only interrupt tests"
    echo "  timing        - Run only timing tests"
    echo "  main          - Run only main testbench"
    echo ""
    echo "Build Types:"
    echo "  release       - Optimized build (default)"
    echo "  debug         - Debug build with symbols"
    echo "  trace         - Build with tracing enabled"
    echo ""
    echo "Examples:"
    echo "  $0                           # Run all tests with default settings"
    echo "  $0 -t -m alu                # Run ALU tests with tracing"
    echo "  $0 -b debug -v              # Run all tests in debug mode with verbose output"
    echo "  $0 --verilator-only -p      # Run only Verilator tests with performance monitoring"
}

# Function to parse command line arguments
parse_arguments() {
    while [[ $# -gt 0 ]]; do
        case $1 in
            -h|--help)
                print_help
                exit 0
                ;;
            -t|--trace)
                ENABLE_TRACE=true
                shift
                ;;
            -p|--performance)
                ENABLE_PERFORMANCE=true
                shift
                ;;
            -b|--build-type)
                BUILD_TYPE="$2"
                shift 2
                ;;
            -m|--test-mode)
                TEST_MODE="$2"
                shift 2
                ;;
            -v|--verbose)
                VERBOSE=true
                shift
                ;;
            -c|--clean)
                CLEAN_BUILD=true
                shift
                ;;
            --verilator-only)
                TEST_MODE="verilator"
                shift
                ;;
            --modelsim-only)
                TEST_MODE="modelsim"
                shift
                ;;
            *)
                echo "Unknown option: $1"
                print_help
                exit 1
                ;;
        esac
    done
}

# Function to check dependencies
check_dependencies() {
    print_status $BLUE "Checking dependencies..."
    
    # Check if Verilator is available
    if ! command -v verilator &> /dev/null; then
        print_status $RED "Error: Verilator not found. Please install Verilator first."
        exit 1
    fi
    
    # Check if ModelSim is available (optional)
    if ! command -v vsim &> /dev/null; then
        print_status $YELLOW "Warning: ModelSim not found. ModelSim tests will be skipped."
        MODELSIM_AVAILABLE=false
    else
        MODELSIM_AVAILABLE=true
    fi
    
    # Check if required directories exist
    if [[ ! -d "$VERILATOR_DIR" ]]; then
        print_status $RED "Error: Verilator directory not found: $VERILATOR_DIR"
        exit 1
    fi
    
    if [[ ! -d "$COMMON_DIR" ]]; then
        print_status $RED "Error: Common test directory not found: $COMMON_DIR"
        exit 1
    fi
    
    print_status $GREEN "Dependencies check completed"
}

# Function to clean build artifacts
clean_build() {
    if [[ "$CLEAN_BUILD" == true ]]; then
        print_status $YELLOW "Cleaning build artifacts..."
        
        if [[ -d "$VERILATOR_DIR" ]]; then
            cd "$VERILATOR_DIR"
            make clean
            cd "$PROJECT_ROOT"
        fi
        
        if [[ -d "$MODELSIM_DIR" ]] && [[ "$MODELSIM_AVAILABLE" == true ]]; then
            cd "$MODELSIM_DIR"
            rm -rf work transcript *.wlf
            cd "$PROJECT_ROOT"
        fi
        
        print_status $GREEN "Build artifacts cleaned"
    fi
}

# Function to run Verilator tests
run_verilator_tests() {
    print_status $BLUE "Running Verilator tests..."
    
    cd "$VERILATOR_DIR"
    
    # Determine build target based on configuration
    local build_target="build"
    if [[ "$BUILD_TYPE" == "debug" ]]; then
        build_target="build_debug"
    elif [[ "$BUILD_TYPE" == "trace" ]] || [[ "$ENABLE_TRACE" == true ]]; then
        build_target="build_trace"
    fi
    
    # Build testbenches
    print_status $BLUE "Building testbenches with target: $build_target"
    if ! make "$build_target"; then
        print_status $RED "Error: Failed to build Verilator testbenches"
        return 1
    fi
    
    # Run tests based on test mode
    case "$TEST_MODE" in
        "all")
            print_status $BLUE "Running all Verilator tests..."
            if [[ "$ENABLE_PERFORMANCE" == true ]]; then
                make test_performance
            else
                make test
            fi
            ;;
        "alu")
            print_status $BLUE "Running ALU tests only..."
            make test_alu_only
            ;;
        "instructions")
            print_status $BLUE "Running instruction tests only..."
            make test_instructions_only
            ;;
        "memory")
            print_status $BLUE "Running memory tests only..."
            make test_memory_only
            ;;
        "interrupt")
            print_status $BLUE "Running interrupt tests only..."
            make test_interrupt_only
            ;;
        "timing")
            print_status $BLUE "Running timing tests only..."
            make test_timing_only
            ;;
        "main")
            print_status $BLUE "Running main testbench only..."
            make test_main
            ;;
        *)
            print_status $RED "Unknown test mode: $TEST_MODE"
            return 1
            ;;
    esac
    
    cd "$PROJECT_ROOT"
    print_status $GREEN "Verilator tests completed"
    return 0
}

# Function to run ModelSim tests
run_modelsim_tests() {
    if [[ "$MODELSIM_AVAILABLE" != true ]]; then
        print_status $YELLOW "Skipping ModelSim tests (not available)"
        return 0
    fi
    
    print_status $BLUE "Running ModelSim tests..."
    
    cd "$MODELSIM_DIR"
    
    # Compile design
    print_status $BLUE "Compiling design in ModelSim..."
    if ! vsim -c -do "compile.do; quit"; then
        print_status $RED "Error: Failed to compile design in ModelSim"
        return 1
    fi
    
    # Run tests
    print_status $BLUE "Running tests in ModelSim..."
    if ! vsim -c -do "run.do; quit"; then
        print_status $RED "Error: Failed to run tests in ModelSim"
        return 1
    fi
    
    cd "$PROJECT_ROOT"
    print_status $GREEN "ModelSim tests completed"
    return 0
}

# Function to run common test validation
run_common_tests() {
    print_status $BLUE "Running common test validation..."
    
    # Check if test vectors exist
    if [[ -f "$COMMON_DIR/test_vectors/alu_test_vectors.txt" ]]; then
        print_status $GREEN "ALU test vectors found"
    else
        print_status $YELLOW "Warning: ALU test vectors not found"
    fi
    
    if [[ -f "$COMMON_DIR/test_vectors/instruction_test_vectors.txt" ]]; then
        print_status $GREEN "Instruction test vectors found"
    else
        print_status $YELLOW "Warning: Instruction test vectors not found"
    fi
    
    if [[ -f "$COMMON_DIR/test_vectors/memory_test_vectors.txt" ]]; then
        print_status $GREEN "Memory test vectors found"
    else
        print_status $YELLOW "Warning: Memory test vectors not found"
    fi
    
    if [[ -f "$COMMON_DIR/test_vectors/interrupt_test_vectors.txt" ]]; then
        print_status $GREEN "Interrupt test vectors found"
    else
        print_status $YELLOW "Warning: Interrupt test vectors not found"
    fi
    
    if [[ -f "$COMMON_DIR/test_vectors/timing_test_vectors.txt" ]]; then
        print_status $GREEN "Timing test vectors found"
    else
        print_status $YELLOW "Warning: Timing test vectors not found"
    fi
    
    # Check if golden references exist
    if [[ -f "$COMMON_DIR/golden_refs/alu_golden_ref.txt" ]]; then
        print_status $GREEN "ALU golden references found"
    else
        print_status $YELLOW "Warning: ALU golden references not found"
    fi
    
    # Check if test programs exist
    if [[ -f "$COMMON_DIR/test_programs/basic_arithmetic.asm" ]]; then
        print_status $GREEN "Basic arithmetic test program found"
    else
        print_status $YELLOW "Warning: Basic arithmetic test program not found"
    fi
    
    if [[ -f "$COMMON_DIR/test_programs/logical_operations.asm" ]]; then
        print_status $GREEN "Logical operations test program found"
    else
        print_status $YELLOW "Warning: Logical operations test program not found"
    fi
    
    if [[ -f "$COMMON_DIR/test_programs/control_flow.asm" ]]; then
        print_status $GREEN "Control flow test program found"
    else
        print_status $YELLOW "Warning: Control flow test program not found"
    fi
    
    if [[ -f "$COMMON_DIR/test_programs/interrupt_handling.asm" ]]; then
        print_status $GREEN "Interrupt handling test program found"
    else
        print_status $YELLOW "Warning: Interrupt handling test program not found"
    fi
    
    print_status $GREEN "Common test validation completed"
}

# Function to generate test report
generate_test_report() {
    print_status $BLUE "Generating test report..."
    
    local report_file="$PROJECT_ROOT/test_report_$(date +%Y%m%d_%H%M%S).txt"
    
    {
        echo "fx68k CPU Test Report"
        echo "====================="
        echo "Generated: $(date)"
        echo "Test Mode: $TEST_MODE"
        echo "Build Type: $BUILD_TYPE"
        echo "Tracing Enabled: $ENABLE_TRACE"
        echo "Performance Monitoring: $ENABLE_PERFORMANCE"
        echo ""
        echo "Test Results:"
        echo "-------------"
        
        # Add test results here if available
        echo "Verilator Tests: Completed"
        if [[ "$MODELSIM_AVAILABLE" == true ]]; then
            echo "ModelSim Tests: Completed"
        else
            echo "ModelSim Tests: Skipped (not available)"
        fi
        
        echo ""
        echo "Configuration:"
        echo "--------------"
        echo "Project Root: $PROJECT_ROOT"
        echo "Verilator Directory: $VERILATOR_DIR"
        echo "ModelSim Directory: $MODELSIM_DIR"
        echo "Common Test Directory: $COMMON_DIR"
        
    } > "$report_file"
    
    print_status $GREEN "Test report generated: $report_file"
}

# Main function
main() {
    print_status $BLUE "Starting fx68k CPU test suite..."
    print_status $BLUE "Project root: $PROJECT_ROOT"
    
    # Parse command line arguments
    parse_arguments "$@"
    
    # Display configuration
    print_status $BLUE "Configuration:"
    echo "  Test Mode: $TEST_MODE"
    echo "  Build Type: $BUILD_TYPE"
    echo "  Tracing: $ENABLE_TRACE"
    echo "  Performance Monitoring: $ENABLE_PERFORMANCE"
    echo "  Verbose: $VERBOSE"
    echo "  Clean Build: $CLEAN_BUILD"
    echo ""
    
    # Check dependencies
    check_dependencies
    
    # Clean build if requested
    clean_build
    
    # Run common test validation
    run_common_tests
    
    # Run tests based on configuration
    local test_result=0
    
    case "$TEST_MODE" in
        "all")
            if ! run_verilator_tests; then
                test_result=1
            fi
            if ! run_modelsim_tests; then
                test_result=1
            fi
            ;;
        "verilator")
            if ! run_verilator_tests; then
                test_result=1
            fi
            ;;
        "modelsim")
            if ! run_modelsim_tests; then
                test_result=1
            fi
            ;;
        *)
            if ! run_verilator_tests; then
                test_result=1
            fi
            ;;
    esac
    
    # Generate test report
    generate_test_report
    
    # Final status
    if [[ $test_result -eq 0 ]]; then
        print_status $GREEN "All tests completed successfully!"
        exit 0
    else
        print_status $RED "Some tests failed!"
        exit 1
    fi
}

# Run main function with all arguments
main "$@"
