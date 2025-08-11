; Basic Arithmetic Test Program for fx68k
; Tests ADD, SUB, MUL, DIV, and related operations

        ORG     $0000

start:
        ; Initialize registers
        MOVE.L  #$12345678,D0    ; Load test value into D0
        MOVE.L  #$87654321,D1    ; Load test value into D1
        MOVE.L  #$00001000,A0    ; Load address into A0
        
        ; Test ADD operations
        ADD.W   D0,D1            ; D1 = D1 + D0 (word)
        ADD.L   D0,D1            ; D1 = D1 + D0 (long)
        ADD.W   #$1234,D0        ; D0 = D0 + immediate
        ADD.L   #$12345678,D1    ; D1 = D1 + immediate
        
        ; Test ADDX operations (with extend)
        ADDX.W  D0,D1            ; D1 = D1 + D0 + X
        ADDX.L  D0,D1            ; D1 = D1 + D0 + X
        
        ; Test SUB operations
        SUB.W   D0,D1            ; D1 = D1 - D0 (word)
        SUB.L   D0,D1            ; D1 = D1 - D0 (long)
        SUB.W   #$1234,D0        ; D0 = D0 - immediate
        SUB.L   #$12345678,D1    ; D1 = D1 - immediate
        
        ; Test SUBX operations (with extend)
        SUBX.W  D0,D1            ; D1 = D1 - D0 - X
        SUBX.L  D0,D1            ; D1 = D1 - D0 - X
        
        ; Test MUL operations
        MULU.W  D0,D1            ; D1 = D1 * D0 (unsigned)
        MULS.W  D0,D1            ; D1 = D1 * D0 (signed)
        
        ; Test DIV operations
        DIVU.W  D0,D1            ; D1 = D1 / D0 (unsigned)
        DIVS.W  D0,D1            ; D1 = D1 / D0 (signed)
        
        ; Test NEG operations
        NEG.W   D0               ; D0 = -D0 (word)
        NEG.L   D1               ; D1 = -D1 (long)
        
        ; Test CLR operations
        CLR.W   D0               ; D0 = 0 (word)
        CLR.L   D1               ; D1 = 0 (long)
        
        ; Test EXT operations
        EXT.W   D0               ; Sign extend byte to word
        EXT.L   D0               ; Sign extend word to long
        
        ; Test SWAP operations
        SWAP    D0               ; Swap upper and lower words
        
        ; Test ABCD and SBCD (BCD arithmetic)
        ABCD    D0,D1            ; D1 = D1 + D0 (BCD)
        SBCD    D0,D1            ; D1 = D1 - D0 (BCD)
        
        ; Test NBCD (negate BCD)
        NBCD    D0               ; D0 = -D0 (BCD)
        
        ; End of test
        BRA     start            ; Loop back to start

; Data section
        ORG     $1000
test_data:
        DC.W    $1234            ; Test data word
        DC.L    $12345678        ; Test data long
        DC.B    $12              ; Test data byte
