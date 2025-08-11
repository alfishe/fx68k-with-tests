; Logical Operations Test Program for fx68k
; Tests AND, OR, EOR, NOT, and related operations

        ORG     $0000

start:
        ; Initialize registers
        MOVE.L  #$F0F0F0F0,D0    ; Load test pattern into D0
        MOVE.L  #$0F0F0F0F,D1    ; Load test pattern into D1
        MOVE.L  #$12345678,D2     ; Load test value into D2
        MOVE.L  #$00001000,A0     ; Load address into A0
        
        ; Test AND operations
        AND.W   D0,D1             ; D1 = D1 & D0 (word)
        AND.L   D0,D1             ; D1 = D1 & D0 (long)
        AND.W   #$0F0F,D0         ; D0 = D0 & immediate (word)
        AND.L   #$0F0F0F0F,D1    ; D1 = D1 & immediate (long)
        AND.W   (A0),D0           ; D0 = D0 & (A0) (word)
        AND.L   (A0),D1           ; D1 = D1 & (A0) (long)
        
        ; Test OR operations
        OR.W    D0,D1             ; D1 = D1 | D0 (word)
        OR.L    D0,D1             ; D1 = D1 | D0 (long)
        OR.W    #$0F0F,D0         ; D0 = D0 | immediate (word)
        OR.L    #$0F0F0F0F,D1    ; D1 = D1 | immediate (long)
        OR.W    (A0),D0           ; D0 = D0 | (A0) (word)
        OR.L    (A0),D1           ; D1 = D1 | (A0) (long)
        
        ; Test EOR operations
        EOR.W   D0,D1             ; D1 = D1 ^ D0 (word)
        EOR.L   D0,D1             ; D1 = D1 ^ D0 (long)
        EOR.W   #$0F0F,D0         ; D0 = D0 ^ immediate (word)
        EOR.L   #$0F0F0F0F,D1    ; D1 = D1 ^ immediate (long)
        EOR.W   (A0),D0           ; D0 = D0 ^ (A0) (word)
        EOR.L   (A0),D1           ; D1 = D1 ^ (A0) (long)
        
        ; Test NOT operations
        NOT.W   D0                ; D0 = ~D0 (word)
        NOT.L   D1                ; D1 = ~D1 (long)
        
        ; Test TST operations
        TST.W   D0                ; Test D0 (word)
        TST.L   D1                ; Test D1 (long)
        TST.W   (A0)              ; Test (A0) (word)
        TST.L   (A0)              ; Test (A0) (long)
        
        ; Test TAS operations
        TAS.W   D0                ; Test and set D0 (word)
        TAS.L   D1                ; Test and set D1 (long)
        TAS.W   (A0)              ; Test and set (A0) (word)
        TAS.L   (A0)              ; Test and set (A0) (long)
        
        ; Test bit manipulation
        BSET    #0,D0             ; Set bit 0 of D0
        BSET    #15,D1            ; Set bit 15 of D1
        BCLR    #0,D0             ; Clear bit 0 of D0
        BCLR    #15,D1            ; Clear bit 15 of D1
        BCHG    #0,D0             ; Toggle bit 0 of D0
        BCHG    #15,D1            ; Toggle bit 15 of D1
        BTST    #0,D0             ; Test bit 0 of D0
        BTST    #15,D1            ; Test bit 15 of D1
        
        ; Test shift operations
        ASL.W   #1,D0             ; Arithmetic shift left D0 by 1
        ASL.W   D2,D0             ; Arithmetic shift left D0 by D2
        ASR.W   #1,D1             ; Arithmetic shift right D1 by 1
        ASR.W   D2,D1             ; Arithmetic shift right D1 by D2
        
        ; Test logical shifts
        LSL.W   #1,D0             ; Logical shift left D0 by 1
        LSL.W   D2,D0             ; Logical shift left D0 by D2
        LSR.W   #1,D1             ; Logical shift right D1 by 1
        LSR.W   D2,D1             ; Logical shift right D1 by D2
        
        ; Test rotate operations
        ROL.W   #1,D0             ; Rotate left D0 by 1
        ROL.W   D2,D0             ; Rotate left D0 by D2
        ROR.W   #1,D1             ; Rotate right D1 by 1
        ROR.W   D2,D1             ; Rotate right D1 by D2
        
        ; Test rotate with extend
        ROXL.W  #1,D0             ; Rotate left with extend D0 by 1
        ROXL.W  D2,D0             ; Rotate left with extend D0 by D2
        ROXR.W  #1,D1             ; Rotate right with extend D1 by 1
        ROXR.W  D2,D1             ; Rotate right with extend D1 by D2
        
        ; Test SWAP
        SWAP    D0                 ; Swap upper and lower words of D0
        SWAP    D1                 ; Swap upper and lower words of D1
        
        ; End of test
        BRA     start              ; Loop back to start

; Data section
        ORG     $1000
test_data:
        DC.W    $AAAA             ; Test pattern word
        DC.L    $BBBBBBBB         ; Test pattern long
        DC.B    $CC               ; Test pattern byte
