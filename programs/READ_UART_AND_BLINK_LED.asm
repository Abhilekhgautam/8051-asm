; blink led 3 times if 'a' is sent, 5 times if 'b' is sent.

ORG 0000H
MOV TMOD, #01H ; MODE 1
MOV TL0, #0F3H
MOV TH0, #0FFH
MOV SCON, #50H
MOV R3, #06H
MOV R5, #0AH
;ACALL THREE_BLINKS
;ACALL FIVE_BLINKS

USER_INPUT:   JNB RI, USER_INPUT
              MOV A, SBUF
              CJNE A, 'A',CHECK_OTHER
              ACALL THREE_BLINKS
CHECK_OTHER:  CJNE A, 'B', USER_INPUT
              ACALL FIVE_BLINKS


THREE_BLINKS: CPL P0.5
              ACALL DELAY
              DJNZ R3, THREE_BLINKS;
              RET

FIVE_BLINKS: CPL P0.5
             ACALL DELAY
             DJNZ R5, FIVE_BLINKS
             RET

DELAY: SETB TR0 ; START THE TIMER
SAME:  JNB TF0, SAME
       CLR TR0
       CLR TI
       RET

END
