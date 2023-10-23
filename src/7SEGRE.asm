ORG 0000H

; Displaying number from 0 to 9 using 7 Segment Display

MYDATA: DB 3FH, 06H, 5BH, 4FH, 66H, 6DH, 7DH, 07H, 7FH, 6FH

MOV DPTR, #MYDATA
MOV R1, #0H
LOOP: MOVC A, @A+DPTR
      ACALL BLINK
      INC R1
      MOV A, R1
      CJNE R1, #0AH, LOOP
      JMP QUIT
BLINK: MOV P1, A
       RET 

QUIT: 
END:
