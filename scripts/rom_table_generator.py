#!/usr/bin/env python3

"""
ROM Table Generator for FX68K Documentation
This script reads microcode and nanocode ROM files and generates markdown tables
with all entries and their decoded bit fields.
"""

import os
from typing import List, Tuple, Dict

def read_rom_file(filename: str) -> List[str]:
    """Read ROM file and return list of binary strings."""
    with open(filename, 'r') as f:
        return [line.strip() for line in f if line.strip()]

def decode_next_addr(bits: str) -> str:
    """Decode next address control field."""
    codes = {
        '000': 'Sequential',
        '001': 'Branch conditional',
        '010': 'Jump subroutine',
        '100': 'Return',
        '101': 'Jump computed',
        '110': 'Special sequence',
        '111': 'Exception'
    }
    return f"[{bits}] {codes.get(bits, 'Unknown')}"

def decode_alu_op(bits: str) -> str:
    """Decode ALU operation field."""
    codes = {
        '000': 'NOP',
        '001': 'Logic',
        '010': 'Shift',
        '011': 'Add',
        '100': 'Subtract',
        '101': 'Multiply',
        '110': 'Divide',
        '111': 'Special'
    }
    return f"[{bits}] {codes.get(bits, 'Unknown')}"

def decode_bus_ctrl(bits: str) -> str:
    """Decode bus control field."""
    codes = {
        '000': 'Internal',
        '001': 'Memory read',
        '010': 'Memory write',
        '011': 'Int ack',
        '100': 'Special',
        '101': 'Stack',
        '110': 'Prefetch',
        '111': 'Exception'
    }
    return f"[{bits}] {codes.get(bits, 'Unknown')}"

def decode_reg_ctrl(bits: str) -> str:
    """Decode register control field."""
    if bits == '0000':
        return f"[{bits}] No reg"
    operations = []
    if bits[0] == '1': operations.append('Data')
    if bits[1] == '1': operations.append('Addr')
    if bits[2] == '1': operations.append('USP')
    if bits[3] == '1': operations.append('CCR')
    return f"[{bits}] {'/'.join(operations) if operations else 'Unknown'}"

def decode_nano_bus(bits: str) -> str:
    """Decode nanocode bus control field."""
    codes = {
        '0000': 'No bus',
        '0001': 'Read',
        '0010': 'Write',
        '0011': 'Addr strobe',
        '0100': 'Data strobe',
        '0101': 'Bus ack',
        '0110': 'Int ack',
        '0111': 'Reset'
    }
    return f"[{bits}] {codes.get(bits, 'Unknown')}"

def decode_nano_reg_transfer(bits: str) -> str:
    """Decode register transfer field."""
    transfers = []
    if bits[0] == '1': transfers.append('reg→abl')
    if bits[1] == '1': transfers.append('reg→abh')
    if bits[2] == '1': transfers.append('reg→dbl')
    if bits[3] == '1': transfers.append('reg→dbh')
    if bits[4] == '1': transfers.append('abl→reg')
    if bits[5] == '1': transfers.append('abh→reg')
    if bits[6] == '1': transfers.append('dbl→reg')
    if bits[7] == '1': transfers.append('dbh→reg')
    return f"[{bits}] {', '.join(transfers) if transfers else 'No transfer'}"

def decode_nano_alu(bits: str) -> str:
    """Decode ALU control field."""
    op = bits[0:3]
    ops = {
        '000': 'Pass A',
        '001': 'Pass B',
        '010': 'Add',
        '011': 'Sub',
        '100': 'AND',
        '101': 'OR',
        '110': 'XOR',
        '111': 'NOT'
    }
    return f"[{bits}] {ops.get(op, 'Unknown')}"

def decode_addr_ctrl(bits: str) -> str:
    """Decode address unit control field."""
    # Extract subfields
    clk_en = bits[0]  # [31]
    au_out = bits[1:3]  # [30:29]
    recharge = bits[3]  # [28]
    atl_ctrl = bits[4:7]  # [27:25]
    ath_ctrl = bits[7:10]  # [24:22]
    au_ctrl = bits[10:13]  # [21:19]
    au_input = bits[13:16]  # [18:16]
    
    # Decode AU output control
    au_out_codes = {
        '00': 'No output',
        '01': 'AU→DB',
        '10': 'AU→AB',
        '11': 'AU→PC'
    }
    
    # Decode AU control
    au_ctrl_codes = {
        '000': 'NOP',
        '001': '+1/+2',
        '010': '-4',
        '011': 'Load AB',
        '100': '+2',
        '101': '+4',
        '110': '-2',
        '111': '-1/-2'
    }
    
    return f"[{bits}] CLK:{clk_en} Out:{au_out_codes.get(au_out,'')} RCH:{recharge} ATL:{atl_ctrl} ATH:{ath_ctrl} AU:{au_ctrl_codes.get(au_ctrl,'')} In:{au_input}"

def get_microcode_description(word: str, addr: int) -> str:
    """Generate description for microcode word based on bit patterns."""
    # Special address ranges
    if addr == 0:
        return "Reset entry point - Initialize system state"
    elif addr == 1:
        return "Setup supervisor mode"
    elif addr == 2:
        return "Load initial PC from reset vector"
    elif addr == 3:
        return "Load initial SR"
    elif addr == 4:
        return "Start normal execution"
    elif addr >= 0x20 and addr <= 0x24:
        return f"Interrupt handling sequence step {addr - 0x20}"
    elif addr >= 0x40 and addr <= 0x44:
        return f"Bus error handling sequence step {addr - 0x40}"
    elif addr >= 0x120 and addr <= 0x123:
        return f"MOVE.W register sequence step {addr - 0x120}"
    elif addr >= 0x140 and addr <= 0x144:
        return f"MOVE.L memory sequence step {addr - 0x140}"
    elif addr >= 0x180 and addr <= 0x183:
        return f"ADD operation sequence step {addr - 0x180}"
    elif addr >= 0x200 and addr <= 0x203:
        return f"MOVEM sequence step {addr - 0x200}"
    
    # If no special case, return decoded control signals
    if word == '0' * len(word):
        return "Unused/Reserved"
    
    return "Standard execution step"

def get_nanocode_description(word: str, addr: int) -> str:
    """Generate description for nanocode word based on bit patterns."""
    # Special addresses
    if addr == 0:
        return "Initial reset state"
    elif addr == 1:
        return "NOP/Reset state"
    elif addr == 4:
        return "Memory read setup"
    elif addr == 0x10:
        return "ALU operation control"
    elif addr == 0x20:
        return "Register-to-register transfer"
    elif addr == 0x45:
        return "ADD operation control"
    elif addr == 0x80:
        return "Memory write setup"
    elif addr == 0x100:
        return "Address increment"
    elif addr == 0x120:
        return "CCR update"
    elif addr == 0x140:
        return "Stack operation"
    elif addr == 0x180:
        return "Exception entry"
    elif addr == 0x200:
        return "Interrupt acknowledge"

    # If no special case, return decoded control signals
    if word == '0' * len(word):
        return "Unused/Reserved"
    
    return "Standard control word"

def generate_markdown_tables() -> Tuple[str, str]:
    """Generate markdown tables for both ROMs with decoded fields."""
    
    # Read ROM files
    micro_rom = read_rom_file('../rtl/microrom.mem')
    nano_rom = read_rom_file('../rtl/nanorom.mem')

    # Generate microcode table
    micro_table = "| Address | Content | Next Addr [16:14] | ALU Op [13:11] | Bus Ctrl [10:8] | Reg Ctrl [7:4] | Seq [3:0] | Description |\n"
    micro_table += "|---------|----------|-----------------|----------------|-----------------|----------------|------------|-------------|\n"
    
    for addr, word in enumerate(micro_rom):
        if word:  # Skip empty lines
            next_addr = decode_next_addr(word[0:3])
            alu_op = decode_alu_op(word[3:6])
            bus_ctrl = decode_bus_ctrl(word[6:9])
            reg_ctrl = decode_reg_ctrl(word[9:13])
            seq = word[13:]
            
            desc = get_microcode_description(word, addr)
            micro_table += f"| 0x{addr:03X} | {word} | {next_addr} | {alu_op} | {bus_ctrl} | {reg_ctrl} | [{seq}] | {desc} |\n"

    # Generate nanocode table
    nano_table = "| Address | Content | Bus [67:64] | Reg Transfer [63:48] | ALU [47:32] | Addr [31:16] | Misc [15:0] | Description |\n"
    nano_table += "|---------|----------|-------------|-------------------|-------------|--------------|-------------|-------------|\n"
    
    for addr, word in enumerate(nano_rom):
        if word:  # Skip empty lines
            bus = decode_nano_bus(word[0:4])
            reg = decode_nano_reg_transfer(word[4:20])
            alu = decode_nano_alu(word[20:36])
            addr_ctrl = decode_addr_ctrl(word[36:52])
            misc = f"[{word[52:]}]"
            
            desc = get_nanocode_description(word, addr)
            nano_table += f"| 0x{addr:03X} | {word} | {bus} | {reg} | {alu} | {addr_ctrl} | {misc} | {desc} |\n"

    return micro_table, nano_table

def main():
    """Main function to generate and save tables."""
    micro_table, nano_table = generate_markdown_tables()
    
    # Save microcode table
    with open('microcode_table.md', 'w') as f:
        f.write("# Complete Microcode ROM Contents\n\n")
        f.write("This table contains all entries from the microcode ROM (1024 x 17-bit) with decoded fields.\n")
        f.write("Each field shows [original bits] followed by decoded meaning.\n\n")
        f.write("## Bit Field Descriptions\n\n")
        f.write("- **Next Addr [16:14]**: Controls program flow\n")
        f.write("  - 000: Sequential execution\n")
        f.write("  - 001: Conditional branch\n")
        f.write("  - 010: Jump to subroutine\n")
        f.write("  - 100: Return from subroutine\n")
        f.write("  - 101: Jump to computed address\n")
        f.write("  - 110: Special sequence\n")
        f.write("  - 111: Exception handling\n\n")
        f.write("- **ALU Op [13:11]**: ALU operation selection\n")
        f.write("  - 000: NOP\n")
        f.write("  - 001: Logic operations\n")
        f.write("  - 010: Shift operations\n")
        f.write("  - 011: Add operations\n")
        f.write("  - 100: Subtract operations\n")
        f.write("  - 101: Multiply\n")
        f.write("  - 110: Divide\n")
        f.write("  - 111: Special ALU functions\n\n")
        f.write("- **Bus Ctrl [10:8]**: Bus operation control\n")
        f.write("  - 000: Internal operation\n")
        f.write("  - 001: Memory read\n")
        f.write("  - 010: Memory write\n")
        f.write("  - 011: Interrupt acknowledge\n")
        f.write("  - 100: Special cycle\n")
        f.write("  - 101: Stack operation\n")
        f.write("  - 110: Prefetch\n")
        f.write("  - 111: Exception stack\n\n")
        f.write("- **Reg Ctrl [7:4]**: Register operation control\n")
        f.write("  - Bit 7: Data register operations\n")
        f.write("  - Bit 6: Address register operations\n")
        f.write("  - Bit 5: User Stack Pointer operations\n")
        f.write("  - Bit 4: CCR operations\n\n")
        f.write("- **Seq [3:0]**: Sequence control bits\n")
        f.write("  - Bits [3:2]: Next address selection mode\n")
        f.write("    - 00: Direct Branch (use dbNma)\n")
        f.write("    - 01: Select between group 1 or address 1\n")
        f.write("    - 10: Use address 2\n")
        f.write("    - 11: Use address 3\n")
        f.write("  - Bit [1]: Format control\n")
        f.write("    - 0: Format I (direct branch)\n")
        f.write("    - 1: Format II (conditional)\n")
        f.write("  - Bit [0]: IR update control\n")
        f.write("    - 0: No IR update\n")
        f.write("    - 1: Update IR from IRC\n\n")
        f.write(micro_table)

    # Save nanocode table
    with open('nanocode_table.md', 'w') as f:
        f.write("# Complete Nanocode ROM Contents\n\n")
        f.write("This table contains all entries from the nanocode ROM (336 x 68-bit) with decoded fields.\n")
        f.write("Each field shows [original bits] followed by decoded meaning.\n\n")
        f.write("## Bit Field Descriptions\n\n")
        f.write("- **Bus [67:64]**: Bus operation control\n")
        f.write("  - 0000: No bus operation\n")
        f.write("  - 0001: Read cycle\n")
        f.write("  - 0010: Write cycle\n")
        f.write("  - 0011: Address strobe\n")
        f.write("  - 0100: Data strobe\n")
        f.write("  - 0101: Bus acknowledge\n")
        f.write("  - 0110: Interrupt acknowledge\n")
        f.write("  - 0111: Reset sequence\n\n")
        f.write("- **Reg Transfer [63:48]**: Register transfer operations\n")
        f.write("  - reg→abl: Register to address bus low\n")
        f.write("  - reg→abh: Register to address bus high\n")
        f.write("  - reg→dbl: Register to data bus low\n")
        f.write("  - reg→dbh: Register to data bus high\n")
        f.write("  - abl→reg: Address bus low to register\n")
        f.write("  - abh→reg: Address bus high to register\n")
        f.write("  - dbl→reg: Data bus low to register\n")
        f.write("  - dbh→reg: Data bus high to register\n\n")
        f.write("- **ALU [47:32]**: ALU operation control\n")
        f.write("  - [47:45]: Operation select\n")
        f.write("    - 000: Pass A\n")
        f.write("    - 001: Pass B\n")
        f.write("    - 010: Add\n")
        f.write("    - 011: Subtract\n")
        f.write("    - 100: AND\n")
        f.write("    - 101: OR\n")
        f.write("    - 110: XOR\n")
        f.write("    - 111: NOT\n")
        f.write("  - [44:40]: Source select\n")
        f.write("  - [39:35]: Destination select\n")
        f.write("  - [34:32]: Size control\n\n")
        f.write("- **Addr [31:16]**: Address unit control\n")
        f.write("  - [31]: Address unit clock enable\n")
        f.write("  - [30:29]: AU output control\n")
        f.write("    - 00: No output\n")
        f.write("    - 01: AU → DB (data bus)\n")
        f.write("    - 10: AU → AB (address bus)\n")
        f.write("    - 11: AU → PC (program counter)\n")
        f.write("  - [28]: ABDHRECHARGE (address bus high recharge)\n")
        f.write("  - [27:25]: ATL control (address temp low)\n")
        f.write("    - 010: DBL → ATL\n")
        f.write("    - 011: ATL → DBL\n")
        f.write("    - 100: ABL → ATL\n")
        f.write("    - 101: ATL → ABL\n")
        f.write("  - [24:22]: ATH control (address temp high)\n")
        f.write("    - Similar to ATL but for high bytes\n")
        f.write("  - [21:19]: AU control (arithmetic unit)\n")
        f.write("    - 000: No operation\n")
        f.write("    - 001: +1/+2 (byte/word)\n")
        f.write("    - 010: -4\n")
        f.write("    - 011: Load from AB\n")
        f.write("    - 100: +2\n")
        f.write("    - 101: +4\n")
        f.write("    - 110: -2\n")
        f.write("    - 111: -1/-2 (byte/word)\n")
        f.write("  - [18:16]: AU input control\n\n")
        f.write("- **Misc [15:0]**: Miscellaneous control signals\n")
        f.write("  - [15]: Update CCR\n")
        f.write("  - [14]: Update SR\n")
        f.write("  - [13]: Initialize state\n")
        f.write("  - [12:0]: Various control signals\n\n")
        f.write(nano_table)

if __name__ == '__main__':
    main()