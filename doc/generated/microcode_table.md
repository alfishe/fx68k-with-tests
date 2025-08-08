# Complete Microcode ROM Contents

This table contains all entries from the microcode ROM (1024 x 17-bit) with decoded fields.
Each field shows [original bits] followed by decoded meaning.

## Bit Field Descriptions

- **Next Addr [16:14]**: Controls program flow
  - 000: Sequential execution
  - 001: Conditional branch
  - 010: Jump to subroutine
  - 100: Return from subroutine
  - 101: Jump to computed address
  - 110: Special sequence
  - 111: Exception handling

- **ALU Op [13:11]**: ALU operation selection
  - 000: NOP
  - 001: Logic operations
  - 010: Shift operations
  - 011: Add operations
  - 100: Subtract operations
  - 101: Multiply
  - 110: Divide
  - 111: Special ALU functions

- **Bus Ctrl [10:8]**: Bus operation control
  - 000: Internal operation
  - 001: Memory read
  - 010: Memory write
  - 011: Interrupt acknowledge
  - 100: Special cycle
  - 101: Stack operation
  - 110: Prefetch
  - 111: Exception stack

- **Reg Ctrl [7:4]**: Register operation control
  - Bit 7: Data register operations
  - Bit 6: Address register operations
  - Bit 5: User Stack Pointer operations
  - Bit 4: CCR operations

- **Seq [3:0]**: Sequence control bits
  - Bits [3:2]: Next address selection mode
    - 00: Direct Branch (use dbNma)
    - 01: Select between group 1 or address 1
    - 10: Use address 2
    - 11: Use address 3
  - Bit [1]: Format control
    - 0: Format I (direct branch)
    - 1: Format II (conditional)
  - Bit [0]: IR update control
    - 0: No IR update
    - 1: Update IR from IRC

| Address | Content | Next Addr [16:14] | ALU Op [13:11] | Bus Ctrl [10:8] | Reg Ctrl [7:4] | Seq [3:0] | Description |
|---------|----------|-----------------|----------------|-----------------|----------------|------------|-------------|
| 0x000 | 10010000101100000 | [100] Return | [100] Subtract | [001] Memory read | [0110] Addr/USP | [0000] | Reset entry point - Initialize system state |
| 0x001 | 10000100000000000 | [100] Return | [001] Logic | [000] Internal | [0000] No reg | [0000] | Setup supervisor mode |
| 0x002 | 00101001011010000 | [001] Branch conditional | [010] Shift | [010] Memory write | [1101] Data/Addr/CCR | [0000] | Load initial PC from reset vector |
| 0x003 | 00111110011000000 | [001] Branch conditional | [111] Special | [100] Special | [1100] Data/Addr | [0000] | Load initial SR |
| 0x004 | 01000000000001100 | [010] Jump subroutine | [000] NOP | [000] Internal | [0000] No reg | [1100] | Start normal execution |
| 0x005 | 01000000000001100 | [010] Jump subroutine | [000] NOP | [000] Internal | [0000] No reg | [1100] | Standard execution step |
| 0x006 | 01000010010000000 | [010] Jump subroutine | [000] NOP | [100] Special | [1000] Data | [0000] | Standard execution step |
| 0x007 | 10001100011100000 | [100] Return | [011] Add | [000] Internal | [1110] Data/Addr/USP | [0000] | Standard execution step |
| 0x008 | 01000100010000000 | [010] Jump subroutine | [001] Logic | [000] Internal | [1000] Data | [0000] | Standard execution step |
| 0x009 | 10000000010000000 | [100] Return | [000] NOP | [000] Internal | [1000] Data | [0000] | Standard execution step |
| 0x00A | 10000000010000000 | [100] Return | [000] NOP | [000] Internal | [1000] Data | [0000] | Standard execution step |
| 0x00B | 01000100010000000 | [010] Jump subroutine | [001] Logic | [000] Internal | [1000] Data | [0000] | Standard execution step |
| 0x00C | 00001010010000000 | [000] Sequential | [010] Shift | [100] Special | [1000] Data | [0000] | Standard execution step |
| 0x00D | 10000000100000000 | [100] Return | [000] NOP | [001] Memory read | [0000] No reg | [0000] | Standard execution step |
| 0x00E | 10000000100000000 | [100] Return | [000] NOP | [001] Memory read | [0000] No reg | [0000] | Standard execution step |
| 0x00F | 01101001100000000 | [011] Unknown | [010] Shift | [011] Int ack | [0000] No reg | [0000] | Standard execution step |
| 0x010 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x011 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x012 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x013 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x014 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x015 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x016 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x017 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x018 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x019 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x01A | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x01B | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x01C | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x01D | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x01E | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x01F | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x020 | 00000000000000100 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0100] | Interrupt handling sequence step 0 |
| 0x021 | 00001010110000000 | [000] Sequential | [010] Shift | [101] Stack | [1000] Data | [0000] | Interrupt handling sequence step 1 |
| 0x022 | 00111000001100000 | [001] Branch conditional | [110] Divide | [000] Internal | [0110] Addr/USP | [0000] | Interrupt handling sequence step 2 |
| 0x023 | 00100101001001010 | [001] Branch conditional | [001] Logic | [010] Memory write | [0100] Addr | [1010] | Interrupt handling sequence step 3 |
| 0x024 | 00000000000001100 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [1100] | Interrupt handling sequence step 4 |
| 0x025 | 10110000110100001 | [101] Jump computed | [100] Subtract | [001] Memory read | [1010] Data/USP | [0001] | Standard execution step |
| 0x026 | 00000000000001100 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [1100] | Standard execution step |
| 0x027 | 00001110100000000 | [000] Sequential | [011] Add | [101] Stack | [0000] No reg | [0000] | Standard execution step |
| 0x028 | 00110100101000000 | [001] Branch conditional | [101] Multiply | [001] Memory read | [0100] Addr | [0000] | Standard execution step |
| 0x029 | 00100011010100000 | [001] Branch conditional | [000] NOP | [110] Prefetch | [1010] Data/USP | [0000] | Standard execution step |
| 0x02A | 00000010010000000 | [000] Sequential | [000] NOP | [100] Special | [1000] Data | [0000] | Standard execution step |
| 0x02B | 10000110000000010 | [100] Return | [001] Logic | [100] Special | [0000] No reg | [0010] | Standard execution step |
| 0x02C | 00111110110000000 | [001] Branch conditional | [111] Special | [101] Stack | [1000] Data | [0000] | Standard execution step |
| 0x02D | 00000100011100000 | [000] Sequential | [001] Logic | [000] Internal | [1110] Data/Addr/USP | [0000] | Standard execution step |
| 0x02E | 00101111010100000 | [001] Branch conditional | [011] Add | [110] Prefetch | [1010] Data/USP | [0000] | Standard execution step |
| 0x02F | 10010011100000010 | [100] Return | [100] Subtract | [111] Exception | [0000] No reg | [0010] | Standard execution step |
| 0x030 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x031 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x032 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x033 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x034 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x035 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x036 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x037 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x038 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x039 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x03A | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x03B | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x03C | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x03D | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x03E | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x03F | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x040 | 10011101000000000 | [100] Return | [111] Special | [010] Memory write | [0000] No reg | [0000] | Bus error handling sequence step 0 |
| 0x041 | 00000100110010110 | [000] Sequential | [001] Logic | [001] Memory read | [1001] Data/CCR | [0110] | Bus error handling sequence step 1 |
| 0x042 | 00101001010000000 | [001] Branch conditional | [010] Shift | [010] Memory write | [1000] Data | [0000] | Bus error handling sequence step 2 |
| 0x043 | 10110000110100001 | [101] Jump computed | [100] Subtract | [001] Memory read | [1010] Data/USP | [0001] | Bus error handling sequence step 3 |
| 0x044 | 00000000000000100 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0100] | Bus error handling sequence step 4 |
| 0x045 | 00111110000100000 | [001] Branch conditional | [111] Special | [100] Special | [0010] USP | [0000] | Standard execution step |
| 0x046 | 10010111010100000 | [100] Return | [101] Multiply | [110] Prefetch | [1010] Data/USP | [0000] | Standard execution step |
| 0x047 | 01000110000100000 | [010] Jump subroutine | [001] Logic | [100] Special | [0010] USP | [0000] | Standard execution step |
| 0x048 | 01010111100000000 | [010] Jump subroutine | [101] Multiply | [111] Exception | [0000] No reg | [0000] | Standard execution step |
| 0x049 | 10001010010011010 | [100] Return | [010] Shift | [100] Special | [1001] Data/CCR | [1010] | Standard execution step |
| 0x04A | 01000110010100001 | [010] Jump subroutine | [001] Logic | [100] Special | [1010] Data/USP | [0001] | Standard execution step |
| 0x04B | 00000110010111010 | [000] Sequential | [001] Logic | [100] Special | [1011] Data/USP/CCR | [1010] | Standard execution step |
| 0x04C | 01001100010100000 | [010] Jump subroutine | [011] Add | [000] Internal | [1010] Data/USP | [0000] | Standard execution step |
| 0x04D | 10001010010010111 | [100] Return | [010] Shift | [100] Special | [1001] Data/CCR | [0111] | Standard execution step |
| 0x04E | 01000000000100001 | [010] Jump subroutine | [000] NOP | [000] Internal | [0010] USP | [0001] | Standard execution step |
| 0x04F | 00110100111000000 | [001] Branch conditional | [101] Multiply | [001] Memory read | [1100] Data/Addr | [0000] | Standard execution step |
| 0x050 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x051 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x052 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x053 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x054 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x055 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x056 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x057 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x058 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x059 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x05A | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x05B | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x05C | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x05D | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x05E | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x05F | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x060 | 00000010001100000 | [000] Sequential | [000] NOP | [100] Special | [0110] Addr/USP | [0000] | Standard execution step |
| 0x061 | 01001010000100001 | [010] Jump subroutine | [010] Shift | [100] Special | [0010] USP | [0001] | Standard execution step |
| 0x062 | 10110100111000000 | [101] Jump computed | [101] Multiply | [001] Memory read | [1100] Data/Addr | [0000] | Standard execution step |
| 0x063 | 00011011010100000 | [000] Sequential | [110] Divide | [110] Prefetch | [1010] Data/USP | [0000] | Standard execution step |
| 0x064 | 10000000000000100 | [100] Return | [000] NOP | [000] Internal | [0000] No reg | [0100] | Standard execution step |
| 0x065 | 10110100111000000 | [101] Jump computed | [101] Multiply | [001] Memory read | [1100] Data/Addr | [0000] | Standard execution step |
| 0x066 | 00000000000000100 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0100] | Standard execution step |
| 0x067 | 00001000001000000 | [000] Sequential | [010] Shift | [000] Internal | [0100] Addr | [0000] | Standard execution step |
| 0x068 | 00000100011100110 | [000] Sequential | [001] Logic | [000] Internal | [1110] Data/Addr/USP | [0110] | Standard execution step |
| 0x069 | 10001110010100001 | [100] Return | [011] Add | [100] Special | [1010] Data/USP | [0001] | Standard execution step |
| 0x06A | 00000000011110010 | [000] Sequential | [000] NOP | [000] Internal | [1111] Data/Addr/USP/CCR | [0010] | Standard execution step |
| 0x06B | 01001000011000000 | [010] Jump subroutine | [010] Shift | [000] Internal | [1100] Data/Addr | [0000] | Standard execution step |
| 0x06C | 00001000010100110 | [000] Sequential | [010] Shift | [000] Internal | [1010] Data/USP | [0110] | Standard execution step |
| 0x06D | 10001010000110111 | [100] Return | [010] Shift | [100] Special | [0011] USP/CCR | [0111] | Standard execution step |
| 0x06E | 00000000111110010 | [000] Sequential | [000] NOP | [001] Memory read | [1111] Data/Addr/USP/CCR | [0010] | Standard execution step |
| 0x06F | 01001000111000000 | [010] Jump subroutine | [010] Shift | [001] Memory read | [1100] Data/Addr | [0000] | Standard execution step |
| 0x070 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x071 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x072 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x073 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x074 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x075 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x076 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x077 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x078 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x079 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x07A | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x07B | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x07C | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x07D | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x07E | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x07F | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x080 | 10101001000000001 | [101] Jump computed | [010] Shift | [010] Memory write | [0000] No reg | [0001] | Standard execution step |
| 0x081 | 10001000001000001 | [100] Return | [010] Shift | [000] Internal | [0100] Addr | [0001] | Standard execution step |
| 0x082 | 01000000000000100 | [010] Jump subroutine | [000] NOP | [000] Internal | [0000] No reg | [0100] | Standard execution step |
| 0x083 | 01001100001111010 | [010] Jump subroutine | [011] Add | [000] Internal | [0111] Addr/USP/CCR | [1010] | Standard execution step |
| 0x084 | 00000110001000000 | [000] Sequential | [001] Logic | [100] Special | [0100] Addr | [0000] | Standard execution step |
| 0x085 | 00010110001100000 | [000] Sequential | [101] Multiply | [100] Special | [0110] Addr/USP | [0000] | Standard execution step |
| 0x086 | 00011010000000000 | [000] Sequential | [110] Divide | [100] Special | [0000] No reg | [0000] | Standard execution step |
| 0x087 | 10110000110100001 | [101] Jump computed | [100] Subtract | [001] Memory read | [1010] Data/USP | [0001] | Standard execution step |
| 0x088 | 01111000001100000 | [011] Unknown | [110] Divide | [000] Internal | [0110] Addr/USP | [0000] | Standard execution step |
| 0x089 | 00011000000000000 | [000] Sequential | [110] Divide | [000] Internal | [0000] No reg | [0000] | Standard execution step |
| 0x08A | 00000100100100001 | [000] Sequential | [001] Logic | [001] Memory read | [0010] USP | [0001] | Standard execution step |
| 0x08B | 00000000000000100 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0100] | Standard execution step |
| 0x08C | 00000000101100000 | [000] Sequential | [000] NOP | [001] Memory read | [0110] Addr/USP | [0000] | Standard execution step |
| 0x08D | 00000000000000100 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0100] | Standard execution step |
| 0x08E | 00010001010100000 | [000] Sequential | [100] Subtract | [010] Memory write | [1010] Data/USP | [0000] | Standard execution step |
| 0x08F | 10010111000100001 | [100] Return | [101] Multiply | [110] Prefetch | [0010] USP | [0001] | Standard execution step |
| 0x090 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x091 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x092 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x093 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x094 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x095 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x096 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x097 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x098 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x099 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x09A | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x09B | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x09C | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x09D | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x09E | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x09F | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x0A0 | 00000010001100000 | [000] Sequential | [000] NOP | [100] Special | [0110] Addr/USP | [0000] | Standard execution step |
| 0x0A1 | 00000000000000100 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0100] | Standard execution step |
| 0x0A2 | 01111000011100000 | [011] Unknown | [110] Divide | [000] Internal | [1110] Data/Addr/USP | [0000] | Standard execution step |
| 0x0A3 | 00011011010100000 | [000] Sequential | [110] Divide | [110] Prefetch | [1010] Data/USP | [0000] | Standard execution step |
| 0x0A4 | 00101101000000000 | [001] Branch conditional | [011] Add | [010] Memory write | [0000] No reg | [0000] | Standard execution step |
| 0x0A5 | 01000110010111010 | [010] Jump subroutine | [001] Logic | [100] Special | [1011] Data/USP/CCR | [1010] | Standard execution step |
| 0x0A6 | 00101101000000000 | [001] Branch conditional | [011] Add | [010] Memory write | [0000] No reg | [0000] | Standard execution step |
| 0x0A7 | 10001010101100000 | [100] Return | [010] Shift | [101] Stack | [0110] Addr/USP | [0000] | Standard execution step |
| 0x0A8 | 01010110001100000 | [010] Jump subroutine | [101] Multiply | [100] Special | [0110] Addr/USP | [0000] | Standard execution step |
| 0x0A9 | 00011000110000000 | [000] Sequential | [110] Divide | [001] Memory read | [1000] Data | [0000] | Standard execution step |
| 0x0AA | 01010110001100000 | [010] Jump subroutine | [101] Multiply | [100] Special | [0110] Addr/USP | [0000] | Standard execution step |
| 0x0AB | 10001110011100001 | [100] Return | [011] Add | [100] Special | [1110] Data/Addr/USP | [0001] | Standard execution step |
| 0x0AC | 00000100101100000 | [000] Sequential | [001] Logic | [001] Memory read | [0110] Addr/USP | [0000] | Standard execution step |
| 0x0AD | 01000110010111010 | [010] Jump subroutine | [001] Logic | [100] Special | [1011] Data/USP/CCR | [1010] | Standard execution step |
| 0x0AE | 00000100101100000 | [000] Sequential | [001] Logic | [001] Memory read | [0110] Addr/USP | [0000] | Standard execution step |
| 0x0AF | 10001010111100000 | [100] Return | [010] Shift | [101] Stack | [1110] Data/Addr/USP | [0000] | Standard execution step |
| 0x0B0 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x0B1 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x0B2 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x0B3 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x0B4 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x0B5 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x0B6 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x0B7 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x0B8 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x0B9 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x0BA | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x0BB | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x0BC | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x0BD | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x0BE | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x0BF | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x0C0 | 10101001000000001 | [101] Jump computed | [010] Shift | [010] Memory write | [0000] No reg | [0001] | Standard execution step |
| 0x0C1 | 00001000101010110 | [000] Sequential | [010] Shift | [001] Memory read | [0101] Addr/CCR | [0110] | Standard execution step |
| 0x0C2 | 00011111010100000 | [000] Sequential | [111] Special | [110] Prefetch | [1010] Data/USP | [0000] | Standard execution step |
| 0x0C3 | 01101101110000000 | [011] Unknown | [011] Add | [011] Int ack | [1000] Data | [0000] | Standard execution step |
| 0x0C4 | 00000000000000100 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0100] | Standard execution step |
| 0x0C5 | 10111110000100000 | [101] Jump computed | [111] Special | [100] Special | [0010] USP | [0000] | Standard execution step |
| 0x0C6 | 00000100011100000 | [000] Sequential | [001] Logic | [000] Internal | [1110] Data/Addr/USP | [0000] | Standard execution step |
| 0x0C7 | 10001100101000001 | [100] Return | [011] Add | [001] Memory read | [0100] Addr | [0001] | Standard execution step |
| 0x0C8 | 00000110001000000 | [000] Sequential | [001] Logic | [100] Special | [0100] Addr | [0000] | Standard execution step |
| 0x0C9 | 00001110000010010 | [000] Sequential | [011] Add | [100] Special | [0001] CCR | [0010] | Standard execution step |
| 0x0CA | 00100101000010110 | [001] Branch conditional | [001] Logic | [010] Memory write | [0001] CCR | [0110] | Standard execution step |
| 0x0CB | 00101101000100000 | [001] Branch conditional | [011] Add | [010] Memory write | [0010] USP | [0000] | Standard execution step |
| 0x0CC | 00000000011100000 | [000] Sequential | [000] NOP | [000] Internal | [1110] Data/Addr/USP | [0000] | Standard execution step |
| 0x0CD | 00001000111100000 | [000] Sequential | [010] Shift | [001] Memory read | [1110] Data/Addr/USP | [0000] | Standard execution step |
| 0x0CE | 00100101000011010 | [001] Branch conditional | [001] Logic | [010] Memory write | [0001] CCR | [1010] | Standard execution step |
| 0x0CF | 00110100111000000 | [001] Branch conditional | [101] Multiply | [001] Memory read | [1100] Data/Addr | [0000] | Standard execution step |
| 0x0D0 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x0D1 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x0D2 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x0D3 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x0D4 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x0D5 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x0D6 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x0D7 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x0D8 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x0D9 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x0DA | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x0DB | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x0DC | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x0DD | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x0DE | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x0DF | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x0E0 | 00000010000100010 | [000] Sequential | [000] NOP | [100] Special | [0010] USP | [0010] | Standard execution step |
| 0x0E1 | 00001010110000000 | [000] Sequential | [010] Shift | [101] Stack | [1000] Data | [0000] | Standard execution step |
| 0x0E2 | 00000000000000100 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0100] | Standard execution step |
| 0x0E3 | 00101101010000000 | [001] Branch conditional | [011] Add | [010] Memory write | [1000] Data | [0000] | Standard execution step |
| 0x0E4 | 01010001010000000 | [010] Jump subroutine | [100] Subtract | [010] Memory write | [1000] Data | [0000] | Standard execution step |
| 0x0E5 | 01000110111000000 | [010] Jump subroutine | [001] Logic | [101] Stack | [1100] Data/Addr | [0000] | Standard execution step |
| 0x0E6 | 00000000000000100 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0100] | Standard execution step |
| 0x0E7 | 00000000010110010 | [000] Sequential | [000] NOP | [000] Internal | [1011] Data/USP/CCR | [0010] | Standard execution step |
| 0x0E8 | 00110100101000000 | [001] Branch conditional | [101] Multiply | [001] Memory read | [0100] Addr | [0000] | Standard execution step |
| 0x0E9 | 00100011010100000 | [001] Branch conditional | [000] NOP | [110] Prefetch | [1010] Data/USP | [0000] | Standard execution step |
| 0x0EA | 10000000000001000 | [100] Return | [000] NOP | [000] Internal | [0000] No reg | [1000] | Standard execution step |
| 0x0EB | 01101011010000000 | [011] Unknown | [010] Shift | [110] Prefetch | [1000] Data | [0000] | Standard execution step |
| 0x0EC | 00111110110000000 | [001] Branch conditional | [111] Special | [101] Stack | [1000] Data | [0000] | Standard execution step |
| 0x0ED | 00000100011100000 | [000] Sequential | [001] Logic | [000] Internal | [1110] Data/Addr/USP | [0000] | Standard execution step |
| 0x0EE | 10010101000000000 | [100] Return | [101] Multiply | [010] Memory write | [0000] No reg | [0000] | Standard execution step |
| 0x0EF | 01111110010100000 | [011] Unknown | [111] Special | [100] Special | [1010] Data/USP | [0000] | Standard execution step |
| 0x0F0 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x0F1 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x0F2 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x0F3 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x0F4 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x0F5 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x0F6 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x0F7 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x0F8 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x0F9 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x0FA | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x0FB | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x0FC | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x0FD | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x0FE | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x0FF | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x100 | 10001100101000001 | [100] Return | [011] Add | [001] Memory read | [0100] Addr | [0001] | Standard execution step |
| 0x101 | 10000010100000010 | [100] Return | [000] NOP | [101] Stack | [0000] No reg | [0010] | Standard execution step |
| 0x102 | 01000010101000000 | [010] Jump subroutine | [000] NOP | [101] Stack | [0100] Addr | [0000] | Standard execution step |
| 0x103 | 00011111100100000 | [000] Sequential | [111] Special | [111] Exception | [0010] USP | [0000] | Standard execution step |
| 0x104 | 10100111100000001 | [101] Jump computed | [001] Logic | [111] Exception | [0000] No reg | [0001] | Standard execution step |
| 0x105 | 10010010110000010 | [100] Return | [100] Subtract | [101] Stack | [1000] Data | [0010] | Standard execution step |
| 0x106 | 01110100111000000 | [011] Unknown | [101] Multiply | [001] Memory read | [1100] Data/Addr | [0000] | Standard execution step |
| 0x107 | 00010111010000000 | [000] Sequential | [101] Multiply | [110] Prefetch | [1000] Data | [0000] | Standard execution step |
| 0x108 | 10101011100000001 | [101] Jump computed | [010] Shift | [111] Exception | [0000] No reg | [0001] | Standard execution step |
| 0x109 | 10010010100000010 | [100] Return | [100] Subtract | [101] Stack | [0000] No reg | [0010] | Standard execution step |
| 0x10A | 01110000100100000 | [011] Unknown | [100] Subtract | [001] Memory read | [0010] USP | [0000] | Standard execution step |
| 0x10B | 00000000100100000 | [000] Sequential | [000] NOP | [001] Memory read | [0010] USP | [0000] | Standard execution step |
| 0x10C | 10100101100100001 | [101] Jump computed | [001] Logic | [011] Int ack | [0010] USP | [0001] | Standard execution step |
| 0x10D | 10000010110000010 | [100] Return | [000] NOP | [101] Stack | [1000] Data | [0010] | Standard execution step |
| 0x10E | 01001010101000000 | [010] Jump subroutine | [010] Shift | [101] Stack | [0100] Addr | [0000] | Standard execution step |
| 0x10F | 00010111000000000 | [000] Sequential | [101] Multiply | [110] Prefetch | [0000] No reg | [0000] | Standard execution step |
| 0x110 | 00010001000010110 | [000] Sequential | [100] Subtract | [010] Memory write | [0001] CCR | [0110] | Standard execution step |
| 0x111 | 01110010100111010 | [011] Unknown | [100] Subtract | [101] Stack | [0011] USP/CCR | [1010] | Standard execution step |
| 0x112 | 10110100010000000 | [101] Jump computed | [101] Multiply | [000] Internal | [1000] Data | [0000] | Standard execution step |
| 0x113 | 00110100111000000 | [001] Branch conditional | [101] Multiply | [001] Memory read | [1100] Data/Addr | [0000] | Standard execution step |
| 0x114 | 01000010010000110 | [010] Jump subroutine | [000] NOP | [100] Special | [1000] Data | [0110] | Standard execution step |
| 0x115 | 01110010110111011 | [011] Unknown | [100] Subtract | [101] Stack | [1011] Data/USP/CCR | [1011] | Standard execution step |
| 0x116 | 01111100000000000 | [011] Unknown | [111] Special | [000] Internal | [0000] No reg | [0000] | Standard execution step |
| 0x117 | 00101101000100000 | [001] Branch conditional | [011] Add | [010] Memory write | [0010] USP | [0000] | Standard execution step |
| 0x118 | 00101001001010001 | [001] Branch conditional | [010] Shift | [010] Memory write | [0101] Addr/CCR | [0001] | Standard execution step |
| 0x119 | 01011011111100000 | [010] Jump subroutine | [110] Divide | [111] Exception | [1110] Data/Addr/USP | [0000] | Standard execution step |
| 0x11A | 01101111011000000 | [011] Unknown | [011] Add | [110] Prefetch | [1100] Data/Addr | [0000] | Standard execution step |
| 0x11B | 00100011100000000 | [001] Branch conditional | [000] NOP | [111] Exception | [0000] No reg | [0000] | Standard execution step |
| 0x11C | 00111110000110000 | [001] Branch conditional | [111] Special | [100] Special | [0011] USP/CCR | [0000] | Standard execution step |
| 0x11D | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x11E | 10101111011000000 | [101] Jump computed | [011] Add | [110] Prefetch | [1100] Data/Addr | [0000] | Standard execution step |
| 0x11F | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x120 | 00001010100000000 | [000] Sequential | [010] Shift | [101] Stack | [0000] No reg | [0000] | MOVE.W register sequence step 0 |
| 0x121 | 10101011100100001 | [101] Jump computed | [010] Shift | [111] Exception | [0010] USP | [0001] | MOVE.W register sequence step 1 |
| 0x122 | 01010011000100001 | [010] Jump subroutine | [100] Subtract | [110] Prefetch | [0010] USP | [0001] | MOVE.W register sequence step 2 |
| 0x123 | 10010101010000000 | [100] Return | [101] Multiply | [010] Memory write | [1000] Data | [0000] | MOVE.W register sequence step 3 |
| 0x124 | 00000000110000000 | [000] Sequential | [000] NOP | [001] Memory read | [1000] Data | [0000] | Standard execution step |
| 0x125 | 10111010000100001 | [101] Jump computed | [110] Divide | [100] Special | [0010] USP | [0001] | Standard execution step |
| 0x126 | 01011001010000000 | [010] Jump subroutine | [110] Divide | [010] Memory write | [1000] Data | [0000] | Standard execution step |
| 0x127 | 10010101000000000 | [100] Return | [101] Multiply | [010] Memory write | [0000] No reg | [0000] | Standard execution step |
| 0x128 | 00101101101100000 | [001] Branch conditional | [011] Add | [011] Int ack | [0110] Addr/USP | [0000] | Standard execution step |
| 0x129 | 10100011100100001 | [101] Jump computed | [000] NOP | [111] Exception | [0010] USP | [0001] | Standard execution step |
| 0x12A | 01011110100000000 | [010] Jump subroutine | [111] Special | [101] Stack | [0000] No reg | [0000] | Standard execution step |
| 0x12B | 01110100011100000 | [011] Unknown | [101] Multiply | [000] Internal | [1110] Data/Addr/USP | [0000] | Standard execution step |
| 0x12C | 00101011111000000 | [001] Branch conditional | [010] Shift | [111] Exception | [1100] Data/Addr | [0000] | Standard execution step |
| 0x12D | 10110000110100001 | [101] Jump computed | [100] Subtract | [001] Memory read | [1010] Data/USP | [0001] | Standard execution step |
| 0x12E | 01010101010100001 | [010] Jump subroutine | [101] Multiply | [010] Memory write | [1010] Data/USP | [0001] | Standard execution step |
| 0x12F | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x130 | 00111000100000000 | [001] Branch conditional | [110] Divide | [001] Memory read | [0000] No reg | [0000] | Standard execution step |
| 0x131 | 01011011000000000 | [010] Jump subroutine | [110] Divide | [110] Prefetch | [0000] No reg | [0000] | Standard execution step |
| 0x132 | 00001000100100000 | [000] Sequential | [010] Shift | [001] Memory read | [0010] USP | [0000] | Standard execution step |
| 0x133 | 10001100101000001 | [100] Return | [011] Add | [001] Memory read | [0100] Addr | [0001] | Standard execution step |
| 0x134 | 00100001100000000 | [001] Branch conditional | [000] NOP | [011] Int ack | [0000] No reg | [0000] | Standard execution step |
| 0x135 | 01011011010000000 | [010] Jump subroutine | [110] Divide | [110] Prefetch | [1000] Data | [0000] | Standard execution step |
| 0x136 | 00001000110100000 | [000] Sequential | [010] Shift | [001] Memory read | [1010] Data/USP | [0000] | Standard execution step |
| 0x137 | 10011001110100001 | [100] Return | [110] Divide | [011] Int ack | [1010] Data/USP | [0001] | Standard execution step |
| 0x138 | 00000110010111010 | [000] Sequential | [001] Logic | [100] Special | [1011] Data/USP/CCR | [1010] | Standard execution step |
| 0x139 | 01011011100000000 | [010] Jump subroutine | [110] Divide | [111] Exception | [0000] No reg | [0000] | Standard execution step |
| 0x13A | 00000000110100000 | [000] Sequential | [000] NOP | [001] Memory read | [1010] Data/USP | [0000] | Standard execution step |
| 0x13B | 10011101010000001 | [100] Return | [111] Special | [010] Memory write | [1000] Data | [0001] | Standard execution step |
| 0x13C | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x13D | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x13E | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x13F | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x140 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | MOVE.L memory sequence step 0 |
| 0x141 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | MOVE.L memory sequence step 1 |
| 0x142 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | MOVE.L memory sequence step 2 |
| 0x143 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | MOVE.L memory sequence step 3 |
| 0x144 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | MOVE.L memory sequence step 4 |
| 0x145 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x146 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x147 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x148 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x149 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x14A | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x14B | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x14C | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x14D | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x14E | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x14F | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x150 | 10110000110100001 | [101] Jump computed | [100] Subtract | [001] Memory read | [1010] Data/USP | [0001] | Standard execution step |
| 0x151 | 00011101000100000 | [000] Sequential | [111] Special | [010] Memory write | [0010] USP | [0000] | Standard execution step |
| 0x152 | 00011101000100000 | [000] Sequential | [111] Special | [010] Memory write | [0010] USP | [0000] | Standard execution step |
| 0x153 | 00010001000101110 | [000] Sequential | [100] Subtract | [010] Memory write | [0010] USP | [1110] | Standard execution step |
| 0x154 | 01011010110000000 | [010] Jump subroutine | [110] Divide | [101] Stack | [1000] Data | [0000] | Standard execution step |
| 0x155 | 01011001010100000 | [010] Jump subroutine | [110] Divide | [010] Memory write | [1010] Data/USP | [0000] | Standard execution step |
| 0x156 | 10011101010100000 | [100] Return | [111] Special | [010] Memory write | [1010] Data/USP | [0000] | Standard execution step |
| 0x157 | 00000000000000100 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0100] | Standard execution step |
| 0x158 | 10110000110100001 | [101] Jump computed | [100] Subtract | [001] Memory read | [1010] Data/USP | [0001] | Standard execution step |
| 0x159 | 00110110000000000 | [001] Branch conditional | [101] Multiply | [100] Special | [0000] No reg | [0000] | Standard execution step |
| 0x15A | 10110000011100001 | [101] Jump computed | [100] Subtract | [000] Internal | [1110] Data/Addr/USP | [0001] | Standard execution step |
| 0x15B | 10110000011100001 | [101] Jump computed | [100] Subtract | [000] Internal | [1110] Data/Addr/USP | [0001] | Standard execution step |
| 0x15C | 10011101000000001 | [100] Return | [111] Special | [010] Memory write | [0000] No reg | [0001] | Standard execution step |
| 0x15D | 01110100111000000 | [011] Unknown | [101] Multiply | [001] Memory read | [1100] Data/Addr | [0000] | Standard execution step |
| 0x15E | 00101101100100000 | [001] Branch conditional | [011] Add | [011] Int ack | [0010] USP | [0000] | Standard execution step |
| 0x15F | 10011000100000000 | [100] Return | [110] Divide | [001] Memory read | [0000] No reg | [0000] | Standard execution step |
| 0x160 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x161 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x162 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x163 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x164 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x165 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x166 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x167 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x168 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x169 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x16A | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x16B | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x16C | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x16D | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x16E | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x16F | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x170 | 10000000000000100 | [100] Return | [000] NOP | [000] Internal | [0000] No reg | [0100] | Standard execution step |
| 0x171 | 00000000000000100 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0100] | Standard execution step |
| 0x172 | 00000100111000000 | [000] Sequential | [001] Logic | [001] Memory read | [1100] Data/Addr | [0000] | Standard execution step |
| 0x173 | 00000100111000000 | [000] Sequential | [001] Logic | [001] Memory read | [1100] Data/Addr | [0000] | Standard execution step |
| 0x174 | 00000100111000000 | [000] Sequential | [001] Logic | [001] Memory read | [1100] Data/Addr | [0000] | Standard execution step |
| 0x175 | 00001100010101010 | [000] Sequential | [011] Add | [000] Internal | [1010] Data/USP | [1010] | Standard execution step |
| 0x176 | 00001000000010110 | [000] Sequential | [010] Shift | [000] Internal | [0001] CCR | [0110] | Standard execution step |
| 0x177 | 00101001010000000 | [001] Branch conditional | [010] Shift | [010] Memory write | [1000] Data | [0000] | Standard execution step |
| 0x178 | 10011000100000000 | [100] Return | [110] Divide | [001] Memory read | [0000] No reg | [0000] | Standard execution step |
| 0x179 | 00011011100100000 | [000] Sequential | [110] Divide | [111] Exception | [0010] USP | [0000] | Standard execution step |
| 0x17A | 01000100010000000 | [010] Jump subroutine | [001] Logic | [000] Internal | [1000] Data | [0000] | Standard execution step |
| 0x17B | 01000000000001100 | [010] Jump subroutine | [000] NOP | [000] Internal | [0000] No reg | [1100] | Standard execution step |
| 0x17C | 10011000010000001 | [100] Return | [110] Divide | [000] Internal | [1000] Data | [0001] | Standard execution step |
| 0x17D | 10011011110100000 | [100] Return | [110] Divide | [111] Exception | [1010] Data/USP | [0000] | Standard execution step |
| 0x17E | 10011111110100001 | [100] Return | [111] Special | [111] Exception | [1010] Data/USP | [0001] | Standard execution step |
| 0x17F | 00011000010000000 | [000] Sequential | [110] Divide | [000] Internal | [1000] Data | [0000] | Standard execution step |
| 0x180 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | ADD operation sequence step 0 |
| 0x181 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | ADD operation sequence step 1 |
| 0x182 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | ADD operation sequence step 2 |
| 0x183 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | ADD operation sequence step 3 |
| 0x184 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x185 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x186 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x187 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x188 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x189 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x18A | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x18B | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x18C | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x18D | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x18E | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x18F | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x190 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x191 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x192 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x193 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x194 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x195 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x196 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x197 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x198 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x199 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x19A | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x19B | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x19C | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x19D | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x19E | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x19F | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x1A0 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x1A1 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x1A2 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x1A3 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x1A4 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x1A5 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x1A6 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x1A7 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x1A8 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x1A9 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x1AA | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x1AB | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x1AC | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x1AD | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x1AE | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x1AF | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x1B0 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x1B1 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x1B2 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x1B3 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x1B4 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x1B5 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x1B6 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x1B7 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x1B8 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x1B9 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x1BA | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x1BB | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x1BC | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x1BD | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x1BE | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x1BF | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x1C0 | 00111110001000000 | [001] Branch conditional | [111] Special | [100] Special | [0100] Addr | [0000] | Standard execution step |
| 0x1C1 | 10101011100100001 | [101] Jump computed | [010] Shift | [111] Exception | [0010] USP | [0001] | Standard execution step |
| 0x1C2 | 10001010100000000 | [100] Return | [010] Shift | [101] Stack | [0000] No reg | [0000] | Standard execution step |
| 0x1C3 | 10101011100100001 | [101] Jump computed | [010] Shift | [111] Exception | [0010] USP | [0001] | Standard execution step |
| 0x1C4 | 00100011010000000 | [001] Branch conditional | [000] NOP | [110] Prefetch | [1000] Data | [0000] | Standard execution step |
| 0x1C5 | 10110000001100001 | [101] Jump computed | [100] Subtract | [000] Internal | [0110] Addr/USP | [0001] | Standard execution step |
| 0x1C6 | 10000000110000000 | [100] Return | [000] NOP | [001] Memory read | [1000] Data | [0000] | Standard execution step |
| 0x1C7 | 10110000101100001 | [101] Jump computed | [100] Subtract | [001] Memory read | [0110] Addr/USP | [0001] | Standard execution step |
| 0x1C8 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x1C9 | 10110000101100001 | [101] Jump computed | [100] Subtract | [001] Memory read | [0110] Addr/USP | [0001] | Standard execution step |
| 0x1CA | 10110110110100000 | [101] Jump computed | [101] Multiply | [101] Stack | [1010] Data/USP | [0000] | Standard execution step |
| 0x1CB | 10100001110100001 | [101] Jump computed | [000] NOP | [011] Int ack | [1010] Data/USP | [0001] | Standard execution step |
| 0x1CC | 00111100010000000 | [001] Branch conditional | [111] Special | [000] Internal | [1000] Data | [0000] | Standard execution step |
| 0x1CD | 10011101100000001 | [100] Return | [111] Special | [011] Int ack | [0000] No reg | [0001] | Standard execution step |
| 0x1CE | 10111110100100000 | [101] Jump computed | [111] Special | [101] Stack | [0010] USP | [0000] | Standard execution step |
| 0x1CF | 10010011010100001 | [100] Return | [100] Subtract | [110] Prefetch | [1010] Data/USP | [0001] | Standard execution step |
| 0x1D0 | 00111100010100000 | [001] Branch conditional | [111] Special | [000] Internal | [1010] Data/USP | [0000] | Standard execution step |
| 0x1D1 | 10101011100000001 | [101] Jump computed | [010] Shift | [111] Exception | [0000] No reg | [0001] | Standard execution step |
| 0x1D2 | 10101001101000000 | [101] Jump computed | [010] Shift | [011] Int ack | [0100] Addr | [0000] | Standard execution step |
| 0x1D3 | 10101011100000001 | [101] Jump computed | [010] Shift | [111] Exception | [0000] No reg | [0001] | Standard execution step |
| 0x1D4 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x1D5 | 10011111000100001 | [100] Return | [111] Special | [110] Prefetch | [0010] USP | [0001] | Standard execution step |
| 0x1D6 | 10101001111000000 | [101] Jump computed | [010] Shift | [011] Int ack | [1100] Data/Addr | [0000] | Standard execution step |
| 0x1D7 | 10011011000100001 | [100] Return | [110] Divide | [110] Prefetch | [0010] USP | [0001] | Standard execution step |
| 0x1D8 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x1D9 | 10010011010100001 | [100] Return | [100] Subtract | [110] Prefetch | [1010] Data/USP | [0001] | Standard execution step |
| 0x1DA | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x1DB | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x1DC | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x1DD | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x1DE | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x1DF | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x1E0 | 00001010100000000 | [000] Sequential | [010] Shift | [101] Stack | [0000] No reg | [0000] | Standard execution step |
| 0x1E1 | 10111110000100000 | [101] Jump computed | [111] Special | [100] Special | [0010] USP | [0000] | Standard execution step |
| 0x1E2 | 10000100100000000 | [100] Return | [001] Logic | [001] Memory read | [0000] No reg | [0000] | Standard execution step |
| 0x1E3 | 00111010001100000 | [001] Branch conditional | [110] Divide | [100] Special | [0110] Addr/USP | [0000] | Standard execution step |
| 0x1E4 | 00000000110000000 | [000] Sequential | [000] NOP | [001] Memory read | [1000] Data | [0000] | Standard execution step |
| 0x1E5 | 10011001000000000 | [100] Return | [110] Divide | [010] Memory write | [0000] No reg | [0000] | Standard execution step |
| 0x1E6 | 10000100110000000 | [100] Return | [001] Logic | [001] Memory read | [1000] Data | [0000] | Standard execution step |
| 0x1E7 | 00111010011100000 | [001] Branch conditional | [110] Divide | [100] Special | [1110] Data/Addr/USP | [0000] | Standard execution step |
| 0x1E8 | 00101101101100000 | [001] Branch conditional | [011] Add | [011] Int ack | [0110] Addr/USP | [0000] | Standard execution step |
| 0x1E9 | 10001110111000000 | [100] Return | [011] Add | [101] Stack | [1100] Data/Addr | [0000] | Standard execution step |
| 0x1EA | 10101111101000000 | [101] Jump computed | [011] Add | [111] Exception | [0100] Addr | [0000] | Standard execution step |
| 0x1EB | 00010100100000000 | [000] Sequential | [101] Multiply | [001] Memory read | [0000] No reg | [0000] | Standard execution step |
| 0x1EC | 00101011111000000 | [001] Branch conditional | [010] Shift | [111] Exception | [1100] Data/Addr | [0000] | Standard execution step |
| 0x1ED | 10110100001100000 | [101] Jump computed | [101] Multiply | [000] Internal | [0110] Addr/USP | [0000] | Standard execution step |
| 0x1EE | 10101111111000000 | [101] Jump computed | [011] Add | [111] Exception | [1100] Data/Addr | [0000] | Standard execution step |
| 0x1EF | 00010100010000000 | [000] Sequential | [101] Multiply | [000] Internal | [1000] Data | [0000] | Standard execution step |
| 0x1F0 | 00111000100000000 | [001] Branch conditional | [110] Divide | [001] Memory read | [0000] No reg | [0000] | Standard execution step |
| 0x1F1 | 10110100101100000 | [101] Jump computed | [101] Multiply | [001] Memory read | [0110] Addr/USP | [0000] | Standard execution step |
| 0x1F2 | 10101001010100000 | [101] Jump computed | [010] Shift | [010] Memory write | [1010] Data/USP | [0000] | Standard execution step |
| 0x1F3 | 00101011001000000 | [001] Branch conditional | [010] Shift | [110] Prefetch | [0100] Addr | [0000] | Standard execution step |
| 0x1F4 | 00100001100000000 | [001] Branch conditional | [000] NOP | [011] Int ack | [0000] No reg | [0000] | Standard execution step |
| 0x1F5 | 10001110010000000 | [100] Return | [011] Add | [100] Special | [1000] Data | [0000] | Standard execution step |
| 0x1F6 | 10101111001000000 | [101] Jump computed | [011] Add | [110] Prefetch | [0100] Addr | [0000] | Standard execution step |
| 0x1F7 | 00101011011000000 | [001] Branch conditional | [010] Shift | [110] Prefetch | [1100] Data/Addr | [0000] | Standard execution step |
| 0x1F8 | 00000110010111010 | [000] Sequential | [001] Logic | [100] Special | [1011] Data/USP/CCR | [1010] | Standard execution step |
| 0x1F9 | 10111000110000000 | [101] Jump computed | [110] Divide | [001] Memory read | [1000] Data | [0000] | Standard execution step |
| 0x1FA | 10011101110100000 | [100] Return | [111] Special | [011] Int ack | [1010] Data/USP | [0000] | Standard execution step |
| 0x1FB | 00111010101100000 | [001] Branch conditional | [110] Divide | [101] Stack | [0110] Addr/USP | [0000] | Standard execution step |
| 0x1FC | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x1FD | 10101011011100000 | [101] Jump computed | [010] Shift | [110] Prefetch | [1110] Data/Addr/USP | [0000] | Standard execution step |
| 0x1FE | 01100011110100001 | [011] Unknown | [000] NOP | [111] Exception | [1010] Data/USP | [0001] | Standard execution step |
| 0x1FF | 00111010111100000 | [001] Branch conditional | [110] Divide | [101] Stack | [1110] Data/Addr/USP | [0000] | Standard execution step |
| 0x200 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | MOVEM sequence step 0 |
| 0x201 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | MOVEM sequence step 1 |
| 0x202 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | MOVEM sequence step 2 |
| 0x203 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | MOVEM sequence step 3 |
| 0x204 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x205 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x206 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x207 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x208 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x209 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x20A | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x20B | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x20C | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x20D | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x20E | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x20F | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x210 | 00100101000000000 | [001] Branch conditional | [001] Logic | [010] Memory write | [0000] No reg | [0000] | Standard execution step |
| 0x211 | 00000100000010110 | [000] Sequential | [001] Logic | [000] Internal | [0001] CCR | [0110] | Standard execution step |
| 0x212 | 00000000000000100 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0100] | Standard execution step |
| 0x213 | 00001110000001110 | [000] Sequential | [011] Add | [100] Special | [0000] No reg | [1110] | Standard execution step |
| 0x214 | 00100001000000000 | [001] Branch conditional | [000] NOP | [010] Memory write | [0000] No reg | [0000] | Standard execution step |
| 0x215 | 10110000110100001 | [101] Jump computed | [100] Subtract | [001] Memory read | [1010] Data/USP | [0001] | Standard execution step |
| 0x216 | 00100101011001010 | [001] Branch conditional | [001] Logic | [010] Memory write | [1100] Data/Addr | [1010] | Standard execution step |
| 0x217 | 00111000001100000 | [001] Branch conditional | [110] Divide | [000] Internal | [0110] Addr/USP | [0000] | Standard execution step |
| 0x218 | 00100101100000001 | [001] Branch conditional | [001] Logic | [011] Int ack | [0000] No reg | [0001] | Standard execution step |
| 0x219 | 10011000010000000 | [100] Return | [110] Divide | [000] Internal | [1000] Data | [0000] | Standard execution step |
| 0x21A | 01101101100000000 | [011] Unknown | [011] Add | [011] Int ack | [0000] No reg | [0000] | Standard execution step |
| 0x21B | 00000000000001100 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [1100] | Standard execution step |
| 0x21C | 01100101110000000 | [011] Unknown | [001] Logic | [011] Int ack | [1000] Data | [0000] | Standard execution step |
| 0x21D | 00000000000001100 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [1100] | Standard execution step |
| 0x21E | 00001100001111010 | [000] Sequential | [011] Add | [000] Internal | [0111] Addr/USP/CCR | [1010] | Standard execution step |
| 0x21F | 01001100001111010 | [010] Jump subroutine | [011] Add | [000] Internal | [0111] Addr/USP/CCR | [1010] | Standard execution step |
| 0x220 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x221 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x222 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x223 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x224 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x225 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x226 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x227 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x228 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x229 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x22A | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x22B | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x22C | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x22D | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x22E | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x22F | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x230 | 10101111000000001 | [101] Jump computed | [011] Add | [110] Prefetch | [0000] No reg | [0001] | Standard execution step |
| 0x231 | 00000100111000000 | [000] Sequential | [001] Logic | [001] Memory read | [1100] Data/Addr | [0000] | Standard execution step |
| 0x232 | 10101111000000001 | [101] Jump computed | [011] Add | [110] Prefetch | [0000] No reg | [0001] | Standard execution step |
| 0x233 | 00000000000000100 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0100] | Standard execution step |
| 0x234 | 00100111010000000 | [001] Branch conditional | [001] Logic | [110] Prefetch | [1000] Data | [0000] | Standard execution step |
| 0x235 | 00001110101100000 | [000] Sequential | [011] Add | [101] Stack | [0110] Addr/USP | [0000] | Standard execution step |
| 0x236 | 11010001100000000 | [110] Special sequence | [100] Subtract | [011] Int ack | [0000] No reg | [0000] | Standard execution step |
| 0x237 | 00110010100111010 | [001] Branch conditional | [100] Subtract | [101] Stack | [0011] USP/CCR | [1010] | Standard execution step |
| 0x238 | 00000000000000100 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0100] | Standard execution step |
| 0x239 | 00000100111000000 | [000] Sequential | [001] Logic | [001] Memory read | [1100] Data/Addr | [0000] | Standard execution step |
| 0x23A | 00000000000000100 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0100] | Standard execution step |
| 0x23B | 10110000110100001 | [101] Jump computed | [100] Subtract | [001] Memory read | [1010] Data/USP | [0001] | Standard execution step |
| 0x23C | 01100111110000001 | [011] Unknown | [001] Logic | [111] Exception | [1000] Data | [0001] | Standard execution step |
| 0x23D | 10000000000000100 | [100] Return | [000] NOP | [000] Internal | [0000] No reg | [0100] | Standard execution step |
| 0x23E | 01111100100100000 | [011] Unknown | [111] Special | [001] Memory read | [0010] USP | [0000] | Standard execution step |
| 0x23F | 01100001100100001 | [011] Unknown | [000] NOP | [011] Int ack | [0010] USP | [0001] | Standard execution step |
| 0x240 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x241 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x242 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x243 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x244 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x245 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x246 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x247 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x248 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x249 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x24A | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x24B | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x24C | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x24D | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x24E | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x24F | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x250 | 00000000001100000 | [000] Sequential | [000] NOP | [000] Internal | [0110] Addr/USP | [0000] | Standard execution step |
| 0x251 | 10001010010100001 | [100] Return | [010] Shift | [100] Special | [1010] Data/USP | [0001] | Standard execution step |
| 0x252 | 00110110100000110 | [001] Branch conditional | [101] Multiply | [101] Stack | [0000] No reg | [0110] | Standard execution step |
| 0x253 | 00000000000000100 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0100] | Standard execution step |
| 0x254 | 00100001000000000 | [001] Branch conditional | [000] NOP | [010] Memory write | [0000] No reg | [0000] | Standard execution step |
| 0x255 | 10111110000100000 | [101] Jump computed | [111] Special | [100] Special | [0010] USP | [0000] | Standard execution step |
| 0x256 | 10100111000100000 | [101] Jump computed | [001] Logic | [110] Prefetch | [0010] USP | [0000] | Standard execution step |
| 0x257 | 00111000010000000 | [001] Branch conditional | [110] Divide | [000] Internal | [1000] Data | [0000] | Standard execution step |
| 0x258 | 10000000000000100 | [100] Return | [000] NOP | [000] Internal | [0000] No reg | [0100] | Standard execution step |
| 0x259 | 00101001100100000 | [001] Branch conditional | [010] Shift | [011] Int ack | [0010] USP | [0000] | Standard execution step |
| 0x25A | 00101101100100000 | [001] Branch conditional | [011] Add | [011] Int ack | [0010] USP | [0000] | Standard execution step |
| 0x25B | 00000000000000100 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0100] | Standard execution step |
| 0x25C | 00100101110100000 | [001] Branch conditional | [001] Logic | [011] Int ack | [1010] Data/USP | [0000] | Standard execution step |
| 0x25D | 00000000000000100 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0100] | Standard execution step |
| 0x25E | 00100101110100000 | [001] Branch conditional | [001] Logic | [011] Int ack | [1010] Data/USP | [0000] | Standard execution step |
| 0x25F | 00100101110100000 | [001] Branch conditional | [001] Logic | [011] Int ack | [1010] Data/USP | [0000] | Standard execution step |
| 0x260 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x261 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x262 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x263 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x264 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x265 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x266 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x267 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x268 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x269 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x26A | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x26B | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x26C | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x26D | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x26E | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x26F | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x270 | 10100111000100000 | [101] Jump computed | [001] Logic | [110] Prefetch | [0010] USP | [0000] | Standard execution step |
| 0x271 | 01101011000100000 | [011] Unknown | [010] Shift | [110] Prefetch | [0010] USP | [0000] | Standard execution step |
| 0x272 | 01111110000100001 | [011] Unknown | [111] Special | [100] Special | [0010] USP | [0001] | Standard execution step |
| 0x273 | 10100111000100000 | [101] Jump computed | [001] Logic | [110] Prefetch | [0010] USP | [0000] | Standard execution step |
| 0x274 | 10100111001000000 | [101] Jump computed | [001] Logic | [110] Prefetch | [0100] Addr | [0000] | Standard execution step |
| 0x275 | 10111110000100000 | [101] Jump computed | [111] Special | [100] Special | [0010] USP | [0000] | Standard execution step |
| 0x276 | 00101111010000000 | [001] Branch conditional | [011] Add | [110] Prefetch | [1000] Data | [0000] | Standard execution step |
| 0x277 | 00110010100111010 | [001] Branch conditional | [100] Subtract | [101] Stack | [0011] USP/CCR | [1010] | Standard execution step |
| 0x278 | 00000000000000100 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0100] | Standard execution step |
| 0x279 | 10100011100100001 | [101] Jump computed | [000] NOP | [111] Exception | [0010] USP | [0001] | Standard execution step |
| 0x27A | 00000000000000100 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0100] | Standard execution step |
| 0x27B | 00000010011100001 | [000] Sequential | [000] NOP | [100] Special | [1110] Data/Addr/USP | [0001] | Standard execution step |
| 0x27C | 10100111110100000 | [101] Jump computed | [001] Logic | [111] Exception | [1010] Data/USP | [0000] | Standard execution step |
| 0x27D | 00000000000000100 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0100] | Standard execution step |
| 0x27E | 00101111110100000 | [001] Branch conditional | [011] Add | [111] Exception | [1010] Data/USP | [0000] | Standard execution step |
| 0x27F | 00101111101100000 | [001] Branch conditional | [011] Add | [111] Exception | [0110] Addr/USP | [0000] | Standard execution step |
| 0x280 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x281 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x282 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x283 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x284 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x285 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x286 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x287 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x288 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x289 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x28A | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x28B | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x28C | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x28D | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x28E | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x28F | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x290 | 00100101001000000 | [001] Branch conditional | [001] Logic | [010] Memory write | [0100] Addr | [0000] | Standard execution step |
| 0x291 | 00101001000010110 | [001] Branch conditional | [010] Shift | [010] Memory write | [0001] CCR | [0110] | Standard execution step |
| 0x292 | 00110010000100000 | [001] Branch conditional | [100] Subtract | [100] Special | [0010] USP | [0000] | Standard execution step |
| 0x293 | 00100011000100000 | [001] Branch conditional | [000] NOP | [110] Prefetch | [0010] USP | [0000] | Standard execution step |
| 0x294 | 00100101011000000 | [001] Branch conditional | [001] Logic | [010] Memory write | [1100] Data/Addr | [0000] | Standard execution step |
| 0x295 | 00101001011100000 | [001] Branch conditional | [010] Shift | [010] Memory write | [1110] Data/Addr/USP | [0000] | Standard execution step |
| 0x296 | 00101011110110000 | [001] Branch conditional | [010] Shift | [111] Exception | [1011] Data/USP/CCR | [0000] | Standard execution step |
| 0x297 | 00101111001000000 | [001] Branch conditional | [011] Add | [110] Prefetch | [0100] Addr | [0000] | Standard execution step |
| 0x298 | 00010100000000000 | [000] Sequential | [101] Multiply | [000] Internal | [0000] No reg | [0000] | Standard execution step |
| 0x299 | 10110100111000001 | [101] Jump computed | [101] Multiply | [001] Memory read | [1100] Data/Addr | [0001] | Standard execution step |
| 0x29A | 01110010100100000 | [011] Unknown | [100] Subtract | [101] Stack | [0010] USP | [0000] | Standard execution step |
| 0x29B | 10110000110100001 | [101] Jump computed | [100] Subtract | [001] Memory read | [1010] Data/USP | [0001] | Standard execution step |
| 0x29C | 00010100110000000 | [000] Sequential | [101] Multiply | [001] Memory read | [1000] Data | [0000] | Standard execution step |
| 0x29D | 10110100110100001 | [101] Jump computed | [101] Multiply | [001] Memory read | [1010] Data/USP | [0001] | Standard execution step |
| 0x29E | 01111000110100000 | [011] Unknown | [110] Divide | [001] Memory read | [1010] Data/USP | [0000] | Standard execution step |
| 0x29F | 10111110110100001 | [101] Jump computed | [111] Special | [101] Stack | [1010] Data/USP | [0001] | Standard execution step |
| 0x2A0 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x2A1 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x2A2 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x2A3 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x2A4 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x2A5 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x2A6 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x2A7 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x2A8 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x2A9 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x2AA | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x2AB | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x2AC | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x2AD | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x2AE | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x2AF | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x2B0 | 00100011010100000 | [001] Branch conditional | [000] NOP | [110] Prefetch | [1010] Data/USP | [0000] | Standard execution step |
| 0x2B1 | 00100111000100000 | [001] Branch conditional | [001] Logic | [110] Prefetch | [0010] USP | [0000] | Standard execution step |
| 0x2B2 | 00000110100000010 | [000] Sequential | [001] Logic | [101] Stack | [0000] No reg | [0010] | Standard execution step |
| 0x2B3 | 10111110000100000 | [101] Jump computed | [111] Special | [100] Special | [0010] USP | [0000] | Standard execution step |
| 0x2B4 | 00000100011100000 | [000] Sequential | [001] Logic | [000] Internal | [1110] Data/Addr/USP | [0000] | Standard execution step |
| 0x2B5 | 00110000110000000 | [001] Branch conditional | [100] Subtract | [001] Memory read | [1000] Data | [0000] | Standard execution step |
| 0x2B6 | 00000110110000010 | [000] Sequential | [001] Logic | [101] Stack | [1000] Data | [0010] | Standard execution step |
| 0x2B7 | 10010001110000000 | [100] Return | [100] Subtract | [011] Int ack | [1000] Data | [0000] | Standard execution step |
| 0x2B8 | 10110100111000001 | [101] Jump computed | [101] Multiply | [001] Memory read | [1100] Data/Addr | [0001] | Standard execution step |
| 0x2B9 | 10000000000001000 | [100] Return | [000] NOP | [000] Internal | [0000] No reg | [1000] | Standard execution step |
| 0x2BA | 01110000100100000 | [011] Unknown | [100] Subtract | [001] Memory read | [0010] USP | [0000] | Standard execution step |
| 0x2BB | 10110100101000000 | [101] Jump computed | [101] Multiply | [001] Memory read | [0100] Addr | [0000] | Standard execution step |
| 0x2BC | 10010101110100001 | [100] Return | [101] Multiply | [011] Int ack | [1010] Data/USP | [0001] | Standard execution step |
| 0x2BD | 10111110000100000 | [101] Jump computed | [111] Special | [100] Special | [0010] USP | [0000] | Standard execution step |
| 0x2BE | 01101101111100000 | [011] Unknown | [011] Add | [011] Int ack | [1110] Data/Addr/USP | [0000] | Standard execution step |
| 0x2BF | 10101011101000000 | [101] Jump computed | [010] Shift | [111] Exception | [0100] Addr | [0000] | Standard execution step |
| 0x2C0 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x2C1 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x2C2 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x2C3 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x2C4 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x2C5 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x2C6 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x2C7 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x2C8 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x2C9 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x2CA | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x2CB | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x2CC | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x2CD | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x2CE | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x2CF | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x2D0 | 00101001000010110 | [001] Branch conditional | [010] Shift | [010] Memory write | [0001] CCR | [0110] | Standard execution step |
| 0x2D1 | 10001010011100001 | [100] Return | [010] Shift | [100] Special | [1110] Data/Addr/USP | [0001] | Standard execution step |
| 0x2D2 | 00100001000000110 | [001] Branch conditional | [000] NOP | [010] Memory write | [0000] No reg | [0110] | Standard execution step |
| 0x2D3 | 00101101000000110 | [001] Branch conditional | [011] Add | [010] Memory write | [0000] No reg | [0110] | Standard execution step |
| 0x2D4 | 00101001011100000 | [001] Branch conditional | [010] Shift | [010] Memory write | [1110] Data/Addr/USP | [0000] | Standard execution step |
| 0x2D5 | 10001010011100001 | [100] Return | [010] Shift | [100] Special | [1110] Data/Addr/USP | [0001] | Standard execution step |
| 0x2D6 | 00110110111000110 | [001] Branch conditional | [101] Multiply | [101] Stack | [1100] Data/Addr | [0110] | Standard execution step |
| 0x2D7 | 00101101010000110 | [001] Branch conditional | [011] Add | [010] Memory write | [1000] Data | [0110] | Standard execution step |
| 0x2D8 | 10001100101000001 | [100] Return | [011] Add | [001] Memory read | [0100] Addr | [0001] | Standard execution step |
| 0x2D9 | 10110100101000000 | [101] Jump computed | [101] Multiply | [001] Memory read | [0100] Addr | [0000] | Standard execution step |
| 0x2DA | 10101101101100000 | [101] Jump computed | [011] Add | [011] Int ack | [0110] Addr/USP | [0000] | Standard execution step |
| 0x2DB | 01111110000100001 | [011] Unknown | [111] Special | [100] Special | [0010] USP | [0001] | Standard execution step |
| 0x2DC | 10100101100100001 | [101] Jump computed | [001] Logic | [011] Int ack | [0010] USP | [0001] | Standard execution step |
| 0x2DD | 10101011101000000 | [101] Jump computed | [010] Shift | [111] Exception | [0100] Addr | [0000] | Standard execution step |
| 0x2DE | 10101011111000000 | [101] Jump computed | [010] Shift | [111] Exception | [1100] Data/Addr | [0000] | Standard execution step |
| 0x2DF | 01100001100100001 | [011] Unknown | [000] NOP | [011] Int ack | [0010] USP | [0001] | Standard execution step |
| 0x2E0 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x2E1 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x2E2 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x2E3 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x2E4 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x2E5 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x2E6 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x2E7 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x2E8 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x2E9 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x2EA | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x2EB | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x2EC | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x2ED | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x2EE | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x2EF | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x2F0 | 00110010100111010 | [001] Branch conditional | [100] Subtract | [101] Stack | [0011] USP/CCR | [1010] | Standard execution step |
| 0x2F1 | 10001010010100001 | [100] Return | [010] Shift | [100] Special | [1010] Data/USP | [0001] | Standard execution step |
| 0x2F2 | 10110100100000000 | [101] Jump computed | [101] Multiply | [001] Memory read | [0000] No reg | [0000] | Standard execution step |
| 0x2F3 | 10110100111000001 | [101] Jump computed | [101] Multiply | [001] Memory read | [1100] Data/Addr | [0001] | Standard execution step |
| 0x2F4 | 01110010110111010 | [011] Unknown | [100] Subtract | [101] Stack | [1011] Data/USP/CCR | [1010] | Standard execution step |
| 0x2F5 | 10001010010100001 | [100] Return | [010] Shift | [100] Special | [1010] Data/USP | [0001] | Standard execution step |
| 0x2F6 | 10101011010100000 | [101] Jump computed | [010] Shift | [110] Prefetch | [1010] Data/USP | [0000] | Standard execution step |
| 0x2F7 | 10110100110100001 | [101] Jump computed | [101] Multiply | [001] Memory read | [1010] Data/USP | [0001] | Standard execution step |
| 0x2F8 | 10111100100100001 | [101] Jump computed | [111] Special | [001] Memory read | [0010] USP | [0001] | Standard execution step |
| 0x2F9 | 01101111110000000 | [011] Unknown | [011] Add | [111] Exception | [1000] Data | [0000] | Standard execution step |
| 0x2FA | 01000110010000001 | [010] Jump subroutine | [001] Logic | [100] Special | [1000] Data | [0001] | Standard execution step |
| 0x2FB | 10101111111100000 | [101] Jump computed | [011] Add | [111] Exception | [1110] Data/Addr/USP | [0000] | Standard execution step |
| 0x2FC | 10101011110000001 | [101] Jump computed | [010] Shift | [111] Exception | [1000] Data | [0001] | Standard execution step |
| 0x2FD | 01100011110000000 | [011] Unknown | [000] NOP | [111] Exception | [1000] Data | [0000] | Standard execution step |
| 0x2FE | 01110100100100001 | [011] Unknown | [101] Multiply | [001] Memory read | [0010] USP | [0001] | Standard execution step |
| 0x2FF | 10110000000000000 | [101] Jump computed | [100] Subtract | [000] Internal | [0000] No reg | [0000] | Standard execution step |
| 0x300 | 10011001110000000 | [100] Return | [110] Divide | [011] Int ack | [1000] Data | [0000] | Standard execution step |
| 0x301 | 00110110000000000 | [001] Branch conditional | [101] Multiply | [100] Special | [0000] No reg | [0000] | Standard execution step |
| 0x302 | 00101111001000000 | [001] Branch conditional | [011] Add | [110] Prefetch | [0100] Addr | [0000] | Standard execution step |
| 0x303 | 10111110000100000 | [101] Jump computed | [111] Special | [100] Special | [0010] USP | [0000] | Standard execution step |
| 0x304 | 00110100111000000 | [001] Branch conditional | [101] Multiply | [001] Memory read | [1100] Data/Addr | [0000] | Standard execution step |
| 0x305 | 10001100100100000 | [100] Return | [011] Add | [001] Memory read | [0010] USP | [0000] | Standard execution step |
| 0x306 | 00000000000000100 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0100] | Standard execution step |
| 0x307 | 00110010000000000 | [001] Branch conditional | [100] Subtract | [100] Special | [0000] No reg | [0000] | Standard execution step |
| 0x308 | 00000100010100110 | [000] Sequential | [001] Logic | [000] Internal | [1010] Data/USP | [0110] | Standard execution step |
| 0x309 | 00111110000100000 | [001] Branch conditional | [111] Special | [100] Special | [0010] USP | [0000] | Standard execution step |
| 0x30A | 00111110000100000 | [001] Branch conditional | [111] Special | [100] Special | [0010] USP | [0000] | Standard execution step |
| 0x30B | 10100111011000000 | [101] Jump computed | [001] Logic | [110] Prefetch | [1100] Data/Addr | [0000] | Standard execution step |
| 0x30C | 01110100110000001 | [011] Unknown | [101] Multiply | [001] Memory read | [1000] Data | [0001] | Standard execution step |
| 0x30D | 01110100100100000 | [011] Unknown | [101] Multiply | [001] Memory read | [0010] USP | [0000] | Standard execution step |
| 0x30E | 10010101000000000 | [100] Return | [101] Multiply | [010] Memory write | [0000] No reg | [0000] | Standard execution step |
| 0x30F | 10110110100000000 | [101] Jump computed | [101] Multiply | [101] Stack | [0000] No reg | [0000] | Standard execution step |
| 0x310 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x311 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x312 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x313 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x314 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x315 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x316 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x317 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x318 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x319 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x31A | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x31B | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x31C | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x31D | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x31E | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x31F | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x320 | 00110110000000000 | [001] Branch conditional | [101] Multiply | [100] Special | [0000] No reg | [0000] | Standard execution step |
| 0x321 | 00010110001100000 | [000] Sequential | [101] Multiply | [100] Special | [0110] Addr/USP | [0000] | Standard execution step |
| 0x322 | 00000110010111010 | [000] Sequential | [001] Logic | [100] Special | [1011] Data/USP/CCR | [1010] | Standard execution step |
| 0x323 | 00000110010111010 | [000] Sequential | [001] Logic | [100] Special | [1011] Data/USP/CCR | [1010] | Standard execution step |
| 0x324 | 00110100111000000 | [001] Branch conditional | [101] Multiply | [001] Memory read | [1100] Data/Addr | [0000] | Standard execution step |
| 0x325 | 10111010010000000 | [101] Jump computed | [110] Divide | [100] Special | [1000] Data | [0000] | Standard execution step |
| 0x326 | 00001110110000000 | [000] Sequential | [011] Add | [101] Stack | [1000] Data | [0000] | Standard execution step |
| 0x327 | 00000000000000100 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0100] | Standard execution step |
| 0x328 | 10110000110100001 | [101] Jump computed | [100] Subtract | [001] Memory read | [1010] Data/USP | [0001] | Standard execution step |
| 0x329 | 01111010100000000 | [011] Unknown | [110] Divide | [101] Stack | [0000] No reg | [0000] | Standard execution step |
| 0x32A | 01010110001100001 | [010] Jump subroutine | [101] Multiply | [100] Special | [0110] Addr/USP | [0001] | Standard execution step |
| 0x32B | 10111010110000000 | [101] Jump computed | [110] Divide | [101] Stack | [1000] Data | [0000] | Standard execution step |
| 0x32C | 10110000110100000 | [101] Jump computed | [100] Subtract | [001] Memory read | [1010] Data/USP | [0000] | Standard execution step |
| 0x32D | 00100001010001010 | [001] Branch conditional | [000] NOP | [010] Memory write | [1000] Data | [1010] | Standard execution step |
| 0x32E | 01010110001100001 | [010] Jump subroutine | [101] Multiply | [100] Special | [0110] Addr/USP | [0001] | Standard execution step |
| 0x32F | 01110000100100000 | [011] Unknown | [100] Subtract | [001] Memory read | [0010] USP | [0000] | Standard execution step |
| 0x330 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x331 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x332 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x333 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x334 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x335 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x336 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x337 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x338 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x339 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x33A | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x33B | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x33C | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x33D | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x33E | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x33F | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x340 | 00000100111000000 | [000] Sequential | [001] Logic | [001] Memory read | [1100] Data/Addr | [0000] | Standard execution step |
| 0x341 | 10111000000100001 | [101] Jump computed | [110] Divide | [000] Internal | [0010] USP | [0001] | Standard execution step |
| 0x342 | 00000000000000100 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0100] | Standard execution step |
| 0x343 | 00110000010100000 | [001] Branch conditional | [100] Subtract | [000] Internal | [1010] Data/USP | [0000] | Standard execution step |
| 0x344 | 01111110000100000 | [011] Unknown | [111] Special | [100] Special | [0010] USP | [0000] | Standard execution step |
| 0x345 | 10111000010100001 | [101] Jump computed | [110] Divide | [000] Internal | [1010] Data/USP | [0001] | Standard execution step |
| 0x346 | 00000000000000100 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0100] | Standard execution step |
| 0x347 | 00111000001100000 | [001] Branch conditional | [110] Divide | [000] Internal | [0110] Addr/USP | [0000] | Standard execution step |
| 0x348 | 01111110000100000 | [011] Unknown | [111] Special | [100] Special | [0010] USP | [0000] | Standard execution step |
| 0x349 | 10000000000000100 | [100] Return | [000] NOP | [000] Internal | [0000] No reg | [0100] | Standard execution step |
| 0x34A | 01111100100100000 | [011] Unknown | [111] Special | [001] Memory read | [0010] USP | [0000] | Standard execution step |
| 0x34B | 01000000000000100 | [010] Jump subroutine | [000] NOP | [000] Internal | [0000] No reg | [0100] | Standard execution step |
| 0x34C | 00000000000000100 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0100] | Standard execution step |
| 0x34D | 01110100111000000 | [011] Unknown | [101] Multiply | [001] Memory read | [1100] Data/Addr | [0000] | Standard execution step |
| 0x34E | 01111100110100000 | [011] Unknown | [111] Special | [001] Memory read | [1010] Data/USP | [0000] | Standard execution step |
| 0x34F | 01110010100100000 | [011] Unknown | [100] Subtract | [101] Stack | [0010] USP | [0000] | Standard execution step |
| 0x350 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x351 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x352 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x353 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x354 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x355 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x356 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x357 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x358 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x359 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x35A | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x35B | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x35C | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x35D | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x35E | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x35F | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x360 | 01001110111100000 | [010] Jump subroutine | [011] Add | [101] Stack | [1110] Data/Addr/USP | [0000] | Standard execution step |
| 0x361 | 00000000000000100 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0100] | Standard execution step |
| 0x362 | 00000000000000100 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0100] | Standard execution step |
| 0x363 | 10110000110100001 | [101] Jump computed | [100] Subtract | [001] Memory read | [1010] Data/USP | [0001] | Standard execution step |
| 0x364 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x365 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x366 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x367 | 01011001100000000 | [010] Jump subroutine | [110] Divide | [011] Int ack | [0000] No reg | [0000] | Standard execution step |
| 0x368 | 01111010100100001 | [011] Unknown | [110] Divide | [101] Stack | [0010] USP | [0001] | Standard execution step |
| 0x369 | 00000000001001010 | [000] Sequential | [000] NOP | [000] Internal | [0100] Addr | [1010] | Standard execution step |
| 0x36A | 10000000000000100 | [100] Return | [000] NOP | [000] Internal | [0000] No reg | [0100] | Standard execution step |
| 0x36B | 01110010110100000 | [011] Unknown | [100] Subtract | [101] Stack | [1010] Data/USP | [0000] | Standard execution step |
| 0x36C | 01110110110100000 | [011] Unknown | [101] Multiply | [101] Stack | [1010] Data/USP | [0000] | Standard execution step |
| 0x36D | 01111010110100001 | [011] Unknown | [110] Divide | [101] Stack | [1010] Data/USP | [0001] | Standard execution step |
| 0x36E | 01111110000100000 | [011] Unknown | [111] Special | [100] Special | [0010] USP | [0000] | Standard execution step |
| 0x36F | 00000000000000100 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0100] | Standard execution step |
| 0x370 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x371 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x372 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x373 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x374 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x375 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x376 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x377 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x378 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x379 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x37A | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x37B | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x37C | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x37D | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x37E | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x37F | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x380 | 10001100110100111 | [100] Return | [011] Add | [001] Memory read | [1010] Data/USP | [0111] | Standard execution step |
| 0x381 | 10111100001000001 | [101] Jump computed | [111] Special | [000] Internal | [0100] Addr | [0001] | Standard execution step |
| 0x382 | 10111100001000001 | [101] Jump computed | [111] Special | [000] Internal | [0100] Addr | [0001] | Standard execution step |
| 0x383 | 00101101000000110 | [001] Branch conditional | [011] Add | [010] Memory write | [0000] No reg | [0110] | Standard execution step |
| 0x384 | 10001100101100111 | [100] Return | [011] Add | [001] Memory read | [0110] Addr/USP | [0111] | Standard execution step |
| 0x385 | 10111100011000001 | [101] Jump computed | [111] Special | [000] Internal | [1100] Data/Addr | [0001] | Standard execution step |
| 0x386 | 10111100011000001 | [101] Jump computed | [111] Special | [000] Internal | [1100] Data/Addr | [0001] | Standard execution step |
| 0x387 | 00101101010000110 | [001] Branch conditional | [011] Add | [010] Memory write | [1000] Data | [0110] | Standard execution step |
| 0x388 | 10110100101000000 | [101] Jump computed | [101] Multiply | [001] Memory read | [0100] Addr | [0000] | Standard execution step |
| 0x389 | 01111110000100000 | [011] Unknown | [111] Special | [100] Special | [0010] USP | [0000] | Standard execution step |
| 0x38A | 10110100101000000 | [101] Jump computed | [101] Multiply | [001] Memory read | [0100] Addr | [0000] | Standard execution step |
| 0x38B | 10111100100100001 | [101] Jump computed | [111] Special | [001] Memory read | [0010] USP | [0001] | Standard execution step |
| 0x38C | 10111110110000000 | [101] Jump computed | [111] Special | [101] Stack | [1000] Data | [0000] | Standard execution step |
| 0x38D | 01000000000000100 | [010] Jump subroutine | [000] NOP | [000] Internal | [0000] No reg | [0100] | Standard execution step |
| 0x38E | 10111110110000000 | [101] Jump computed | [111] Special | [101] Stack | [1000] Data | [0000] | Standard execution step |
| 0x38F | 10111000100100001 | [101] Jump computed | [110] Divide | [001] Memory read | [0010] USP | [0001] | Standard execution step |
| 0x390 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x391 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x392 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x393 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x394 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x395 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x396 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x397 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x398 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x399 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x39A | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x39B | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x39C | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x39D | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x39E | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x39F | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x3A0 | 10111110000000000 | [101] Jump computed | [111] Special | [100] Special | [0000] No reg | [0000] | Standard execution step |
| 0x3A1 | 10110010010000001 | [101] Jump computed | [100] Subtract | [100] Special | [1000] Data | [0001] | Standard execution step |
| 0x3A2 | 00111110010000001 | [001] Branch conditional | [111] Special | [100] Special | [1000] Data | [0001] | Standard execution step |
| 0x3A3 | 00111000001100000 | [001] Branch conditional | [110] Divide | [000] Internal | [0110] Addr/USP | [0000] | Standard execution step |
| 0x3A4 | 10101001110000000 | [101] Jump computed | [010] Shift | [011] Int ack | [1000] Data | [0000] | Standard execution step |
| 0x3A5 | 10110000000100001 | [101] Jump computed | [100] Subtract | [000] Internal | [0010] USP | [0001] | Standard execution step |
| 0x3A6 | 00101111100100000 | [001] Branch conditional | [011] Add | [111] Exception | [0010] USP | [0000] | Standard execution step |
| 0x3A7 | 00111000101110000 | [001] Branch conditional | [110] Divide | [001] Memory read | [0111] Addr/USP/CCR | [0000] | Standard execution step |
| 0x3A8 | 00110010100111010 | [001] Branch conditional | [100] Subtract | [101] Stack | [0011] USP/CCR | [1010] | Standard execution step |
| 0x3A9 | 01111010101000000 | [011] Unknown | [110] Divide | [101] Stack | [0100] Addr | [0000] | Standard execution step |
| 0x3AA | 01000110010000001 | [010] Jump subroutine | [001] Logic | [100] Special | [1000] Data | [0001] | Standard execution step |
| 0x3AB | 01000110010000000 | [010] Jump subroutine | [001] Logic | [100] Special | [1000] Data | [0000] | Standard execution step |
| 0x3AC | 01110010110111010 | [011] Unknown | [100] Subtract | [101] Stack | [1011] Data/USP/CCR | [1010] | Standard execution step |
| 0x3AD | 01111010111000000 | [011] Unknown | [110] Divide | [101] Stack | [1100] Data/Addr | [0000] | Standard execution step |
| 0x3AE | 01110100100100001 | [011] Unknown | [101] Multiply | [001] Memory read | [0010] USP | [0001] | Standard execution step |
| 0x3AF | 01110100100100001 | [011] Unknown | [101] Multiply | [001] Memory read | [0010] USP | [0001] | Standard execution step |
| 0x3B0 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x3B1 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x3B2 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x3B3 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x3B4 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x3B5 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x3B6 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x3B7 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x3B8 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x3B9 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x3BA | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x3BB | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x3BC | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x3BD | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x3BE | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x3BF | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x3C0 | 00101001110100000 | [001] Branch conditional | [010] Shift | [011] Int ack | [1010] Data/USP | [0000] | Standard execution step |
| 0x3C1 | 10001100100100000 | [100] Return | [011] Add | [001] Memory read | [0010] USP | [0000] | Standard execution step |
| 0x3C2 | 01110010000100000 | [011] Unknown | [100] Subtract | [100] Special | [0010] USP | [0000] | Standard execution step |
| 0x3C3 | 10110000110100001 | [101] Jump computed | [100] Subtract | [001] Memory read | [1010] Data/USP | [0001] | Standard execution step |
| 0x3C4 | 00000010000011110 | [000] Sequential | [000] NOP | [100] Special | [0001] CCR | [1110] | Standard execution step |
| 0x3C5 | 01111000000000000 | [011] Unknown | [110] Divide | [000] Internal | [0000] No reg | [0000] | Standard execution step |
| 0x3C6 | 01000000101000000 | [010] Jump subroutine | [000] NOP | [001] Memory read | [0100] Addr | [0000] | Standard execution step |
| 0x3C7 | 10110000010000001 | [101] Jump computed | [100] Subtract | [000] Internal | [1000] Data | [0001] | Standard execution step |
| 0x3C8 | 00101101110100000 | [001] Branch conditional | [011] Add | [011] Int ack | [1010] Data/USP | [0000] | Standard execution step |
| 0x3C9 | 10111010000000000 | [101] Jump computed | [110] Divide | [100] Special | [0000] No reg | [0000] | Standard execution step |
| 0x3CA | 01001010001000000 | [010] Jump subroutine | [010] Shift | [100] Special | [0100] Addr | [0000] | Standard execution step |
| 0x3CB | 10110110000100001 | [101] Jump computed | [101] Multiply | [100] Special | [0010] USP | [0001] | Standard execution step |
| 0x3CC | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x3CD | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x3CE | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x3CF | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x3D0 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x3D1 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x3D2 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x3D3 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x3D4 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x3D5 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x3D6 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x3D7 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x3D8 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x3D9 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x3DA | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x3DB | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x3DC | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x3DD | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x3DE | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x3DF | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x3E0 | 10100111101000000 | [101] Jump computed | [001] Logic | [111] Exception | [0100] Addr | [0000] | Standard execution step |
| 0x3E1 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x3E2 | 10010010000000010 | [100] Return | [100] Subtract | [100] Special | [0000] No reg | [0010] | Standard execution step |
| 0x3E3 | 10100111000000001 | [101] Jump computed | [001] Logic | [110] Prefetch | [0000] No reg | [0001] | Standard execution step |
| 0x3E4 | 10100111111000000 | [101] Jump computed | [001] Logic | [111] Exception | [1100] Data/Addr | [0000] | Standard execution step |
| 0x3E5 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x3E6 | 10010010010000010 | [100] Return | [100] Subtract | [100] Special | [1000] Data | [0010] | Standard execution step |
| 0x3E7 | 10001110011100001 | [100] Return | [011] Add | [100] Special | [1110] Data/Addr/USP | [0001] | Standard execution step |
| 0x3E8 | 00100011001100000 | [001] Branch conditional | [000] NOP | [110] Prefetch | [0110] Addr/USP | [0000] | Standard execution step |
| 0x3E9 | 00100001001001010 | [001] Branch conditional | [000] NOP | [010] Memory write | [0100] Addr | [1010] | Standard execution step |
| 0x3EA | 10010011000000010 | [100] Return | [100] Subtract | [110] Prefetch | [0000] No reg | [0010] | Standard execution step |
| 0x3EB | 10001010110100001 | [100] Return | [010] Shift | [101] Stack | [1010] Data/USP | [0001] | Standard execution step |
| 0x3EC | 01100011011100000 | [011] Unknown | [000] NOP | [110] Prefetch | [1110] Data/Addr/USP | [0000] | Standard execution step |
| 0x3ED | 00100001011001010 | [001] Branch conditional | [000] NOP | [010] Memory write | [1100] Data/Addr | [1010] | Standard execution step |
| 0x3EE | 10010011010000010 | [100] Return | [100] Subtract | [110] Prefetch | [1000] Data | [0010] | Standard execution step |
| 0x3EF | 10001010100100001 | [100] Return | [010] Shift | [101] Stack | [0010] USP | [0001] | Standard execution step |
| 0x3F0 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x3F1 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x3F2 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x3F3 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x3F4 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x3F5 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x3F6 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x3F7 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x3F8 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x3F9 | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x3FA | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x3FB | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x3FC | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x3FD | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x3FE | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
| 0x3FF | 00000000000000000 | [000] Sequential | [000] NOP | [000] Internal | [0000] No reg | [0000] | Unused/Reserved |
