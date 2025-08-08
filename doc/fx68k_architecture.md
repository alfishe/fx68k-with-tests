# FX68K - Cycle Accurate M68000 CPU Implementation

## Overview

The FX68K is a cycle-accurate, fully synchronous implementation of the Motorola 68000 processor in SystemVerilog RTL. This implementation is designed for FPGA targets and maintains cycle-accurate compatibility with the original M68000 processor while using a modern synchronous design approach.

## Key Features

- Fully synchronous design
- Cycle-accurate M68000 compatibility
- Microcode and nanocode based control
- Complete M68000 instruction set support
- Exception handling support
- Supervisor/User mode support
- Bus error and address error handling

## Architecture Overview

### Core Components

1. **Main CPU Module (fx68k.sv)**
   - Top-level module implementing the M68000 processor
   - Handles clock generation and bus interface
   - Coordinates all internal components

2. **ALU (fx68kAlu.sv)**
   - Implements all arithmetic and logical operations
   - Supports data manipulation instructions
   - Handles condition code register (CCR) updates

3. **Microcode ROM (microrom.mem)**
   - 1024 x 17-bit ROM containing microcode instructions
   - Controls instruction sequencing
   - Maps M68000 instructions to microcode sequences

4. **Nanocode ROM (nanorom.mem)**
   - 336 x 68-bit ROM containing nanocode instructions
   - Implements detailed control signals
   - Controls datapath operations

5. **Address PLA (uaddrPla.sv)**
   - Programmable Logic Array for instruction decoding
   - Maps opcodes to microcode entry points

### Control Structure

The FX68K uses a two-level control structure:

1. **Microcode Level**
   - 17-bit wide control words
   - Handles instruction sequencing
   - Controls major operation flow
   - Entry points for each instruction

2. **Nanocode Level**
   - 68-bit wide control words
   - Detailed control signals
   - Controls individual datapath operations
   - Implements micro-operation steps

### Clock and Timing

The processor operates with a synchronous clock system:
- Main clock input with phi1/phi2 enables
- Internal T-states (T1-T4) for operation sequencing
- Synchronous bus interface

## Instruction Execution

For detailed information about instruction implementation, including microcode and nanocode sequences, addressing modes, and timing, please refer to [FX68K Instruction Implementation](fx68k_instruction_implementation.md).

### Instruction Flow

1. Fetch Phase
   - Instruction fetched from memory
   - Loaded into IRC (Instruction Register Cache)
   - Decoded by uaddrPla

2. Decode Phase
   - Opcode mapped to microcode entry point
   - Instruction parameters extracted
   - Execution sequence determined

3. Execute Phase
   - Microcode sequence executed
   - Nanocode controls datapath operations
   - ALU performs required operations

### ALU Operations

The ALU supports the following operation types:

1. Arithmetic Operations:
   - ADD, ADDC, ADDX
   - SUB, SUBC, SUBX
   - ABCD, SBCD (Binary-Coded Decimal)

2. Logical Operations:
   - AND, OR, EOR
   - NOT, NEG

3. Shift/Rotate Operations:
   - ASL, ASR (Arithmetic Shift)
   - LSL, LSR (Logical Shift)
   - ROL, ROR (Rotate)
   - ROXL, ROXR (Rotate with Extend)

4. Bit Operations:
   - BTST, BCHG, BCLR, BSET

### Exception Handling

The processor supports the full M68000 exception model:
- Reset exception
- Bus error and address error
- Privilege violations
- Illegal instruction
- Trace mode
- Interrupts (7 levels)

## Bus Interface

The FX68K implements the standard M68000 bus interface:
- 16-bit data bus
- 23-bit address bus
- Asynchronous bus protocol
- DTACK-based handshaking
- Support for VPA (6800 peripheral interface)

## Implementation Details

### Microcode Structure

The microcode ROM (1024 x 17-bit) contains:
- Operation sequencing control
- Condition testing
- Exception handling sequences
- Instruction flow control

### Nanocode Structure

The nanocode ROM (336 x 68-bit) implements:
- Register transfer control
- ALU operation selection
- Bus operation control
- Internal datapath routing

### Key Control Signals

1. Bus Control:
   - AS (Address Strobe)
   - UDS/LDS (Upper/Lower Data Strobes)
   - R/W (Read/Write)
   - FC (Function Code)

2. Internal Control:
   - Register selection
   - ALU operation control
   - Data routing
   - Exception handling

## Performance Characteristics

- Cycle-accurate operation
- Synchronous design for FPGA implementation
- Compatible bus timing with original M68000
- Support for all original timing modes

## Usage Considerations

1. Clock Requirements:
   - Synchronous clock input
   - Phi1/Phi2 enables for timing control

2. Reset Handling:
   - Synchronous reset implementation
   - Power-up reset support

3. Bus Interface:
   - Standard M68000 bus protocol
   - Support for slow devices via DTACK
   - 6800 peripheral support via VPA

## Integration Guidelines

1. Clock Generation:
   - Provide stable clock source
   - Generate proper Phi1/Phi2 enables

2. Memory Interface:
   - Implement proper DTACK generation
   - Handle address/data bus timing

3. Interrupt Handling:
   - Connect interrupt priority levels
   - Implement interrupt acknowledge cycle

4. Reset Circuit:
   - Provide proper power-up reset
   - Handle external reset requests