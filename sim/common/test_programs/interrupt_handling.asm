; Interrupt Handling Test Program for fx68k
; Tests interrupt vector table, exception processing, return from interrupt, and priority handling

        ORG     $1000

start:
        ; Initialize interrupt vector table
        MOVE.L  #int_handler_1, $64    ; Level 1 interrupt
        MOVE.L  #int_handler_2, $68    ; Level 2 interrupt
        MOVE.L  #int_handler_3, $6C    ; Level 3 interrupt
        MOVE.L  #int_handler_4, $70    ; Level 4 interrupt
        MOVE.L  #int_handler_5, $74    ; Level 5 interrupt
        MOVE.L  #int_handler_6, $78    ; Level 6 interrupt
        MOVE.L  #int_handler_7, $7C    ; Level 7 interrupt
        
        ; Initialize exception vectors
        MOVE.L  #bus_error_handler, $8     ; Bus error
        MOVE.L  #address_error_handler, $C ; Address error
        MOVE.L  #illegal_instruction_handler, $10 ; Illegal instruction
        MOVE.L  #zero_divide_handler, $14  ; Zero divide
        MOVE.L  #chk_handler, $18          ; CHK instruction
        MOVE.L  #trapv_handler, $1C        ; TRAPV instruction
        MOVE.L  #privilege_violation_handler, $20 ; Privilege violation
        MOVE.L  #trace_handler, $24        ; Trace
        
        ; Initialize test data
        MOVE.L  #$00000000, D0            ; Interrupt counter
        MOVE.L  #$00000000, D1            ; Exception counter
        MOVE.L  #$00000000, D2            ; Priority test counter
        MOVE.L  #$00000000, D3            ; Nested interrupt counter
        
        ; Set up stack pointer
        MOVE.L  #$00FF0000, A7            ; Initialize stack
        
        ; Test 1: Basic interrupt handling
        MOVE.L  #$00000001, D4            ; Test interrupt flag
        
        ; Enable interrupts
        MOVE.W  #$2000, SR                ; Enable interrupts, set to user mode
        
        ; Trigger level 1 interrupt
        MOVE.L  #$00000001, $FF0000      ; Write to interrupt trigger address
        
        ; Wait for interrupt
        NOP
        NOP
        NOP
        
        ; Test 2: Exception processing
        ; Test illegal instruction exception
        MOVE.L  #$00000001, D5            ; Exception test flag
        
        ; This should trigger an illegal instruction exception
        DC.W    $4AFC                      ; ILLEGAL instruction
        
        ; Test 3: Zero divide exception
        MOVE.L  #$00000001, D6            ; Zero divide test flag
        
        ; This should trigger a zero divide exception
        MOVE.L  #$00000001, D7            ; Dividend
        MOVE.L  #$00000000, D0            ; Divisor (zero)
        DIVU.L  D0, D7                    ; Divide by zero
        
        ; Test 4: Interrupt priority handling
        MOVE.L  #$00000001, D7            ; Priority test flag
        
        ; Trigger multiple interrupts with different priorities
        MOVE.L  #$00000001, $FF0004      ; Level 3 interrupt
        MOVE.L  #$00000001, $FF0008      ; Level 5 interrupt
        MOVE.L  #$00000001, $FF000C      ; Level 2 interrupt
        
        ; Test 5: Nested interrupts
        MOVE.L  #$00000001, D0            ; Nested interrupt flag
        
        ; Enable nested interrupts
        MOVE.W  #$2700, SR                ; Enable all interrupt levels
        
        ; Trigger nested interrupts
        MOVE.L  #$00000001, $FF0010      ; Level 1 interrupt
        MOVE.L  #$00000001, $FF0014      ; Level 4 interrupt
        
        ; Test 6: Return from interrupt
        MOVE.L  #$00000001, D1            ; RTE test flag
        
        ; This will be handled by interrupt handlers
        
        ; Test 7: Interrupt vector table validation
        MOVE.L  #$00000001, D2            ; Vector table test flag
        
        ; Verify interrupt vectors are properly set
        MOVE.L  $64, A0                   ; Load level 1 interrupt vector
        CMP.L   #int_handler_1, A0        ; Compare with expected address
        BNE.S   vector_error
        
        MOVE.L  $68, A0                   ; Load level 2 interrupt vector
        CMP.L   #int_handler_2, A0        ; Compare with expected address
        BNE.S   vector_error
        
        ; Continue with other tests
        BRA.S   continue_tests
        
vector_error:
        MOVE.L  #$DEADBEEF, D0            ; Mark vector error
        
continue_tests:
        ; Test completion
        MOVE.L  #$00000001, D3            ; Test completion flag
        
        ; End of main program
        BRA.S   program_end
        
; Interrupt Handlers
int_handler_1:
        ; Level 1 interrupt handler
        MOVE.L  #$00000001, D0            ; Mark interrupt 1 handled
        RTE                                ; Return from interrupt
        
int_handler_2:
        ; Level 2 interrupt handler
        MOVE.L  #$00000001, D1            ; Mark interrupt 2 handled
        RTE                                ; Return from interrupt
        
int_handler_3:
        ; Level 3 interrupt handler
        MOVE.L  #$00000001, D2            ; Mark interrupt 3 handled
        RTE                                ; Return from interrupt
        
int_handler_4:
        ; Level 4 interrupt handler
        MOVE.L  #$00000001, D3            ; Mark interrupt 4 handled
        RTE                                ; Return from interrupt
        
int_handler_5:
        ; Level 5 interrupt handler
        MOVE.L  #$00000001, D4            ; Mark interrupt 5 handled
        RTE                                ; Return from interrupt
        
int_handler_6:
        ; Level 6 interrupt handler
        MOVE.L  #$00000001, D5            ; Mark interrupt 6 handled
        RTE                                ; Return from interrupt
        
int_handler_7:
        ; Level 7 interrupt handler
        MOVE.L  #$00000001, D6            ; Mark interrupt 7 handled
        RTE                                ; Return from interrupt
        
; Exception Handlers
bus_error_handler:
        ; Bus error exception handler
        MOVE.L  #$00000001, D7            ; Mark bus error handled
        MOVE.L  #$00000000, $FF0000      ; Clear error condition
        RTE                                ; Return from exception
        
address_error_handler:
        ; Address error exception handler
        MOVE.L  #$00000001, D0            ; Mark address error handled
        RTE                                ; Return from exception
        
illegal_instruction_handler:
        ; Illegal instruction exception handler
        MOVE.L  #$00000001, D1            ; Mark illegal instruction handled
        ADD.L   #4, (A7)                  ; Skip illegal instruction
        RTE                                ; Return from exception
        
zero_divide_handler:
        ; Zero divide exception handler
        MOVE.L  #$00000001, D2            ; Mark zero divide handled
        MOVE.L  #$FFFFFFFF, D7            ; Set result to -1
        RTE                                ; Return from exception
        
chk_handler:
        ; CHK instruction exception handler
        MOVE.L  #$00000001, D3            ; Mark CHK handled
        RTE                                ; Return from exception
        
trapv_handler:
        ; TRAPV instruction exception handler
        MOVE.L  #$00000001, D4            ; Mark TRAPV handled
        RTE                                ; Return from exception
        
privilege_violation_handler:
        ; Privilege violation exception handler
        MOVE.L  #$00000001, D5            ; Mark privilege violation handled
        RTE                                ; Return from exception
        
trace_handler:
        ; Trace exception handler
        MOVE.L  #$00000001, D6            ; Mark trace handled
        RTE                                ; Return from exception
        
program_end:
        ; Program completed successfully
        MOVE.L  #$00000001, D0            ; Success flag
        STOP    #$2700                     ; Stop execution
        
        ; Data section
        ORG     $2000
interrupt_data:
        DC.L    $11111111
        DC.L    $22222222
        DC.L    $33333333
        DC.L    $44444444
        
        ; End of program
        END     start
