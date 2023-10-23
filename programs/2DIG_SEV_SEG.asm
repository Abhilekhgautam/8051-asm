; 2 digit seven segment display

ORG 0000H

MYDATA: DB 3FH, 06H, 5BH, 4FH, 66H, 6DH, 7DH, 07H, 7FH, 6FH

MOV DPTR, #MYDATA 
MOV R0, #0H
MOV R1, #0H
LOOP: MOVC A, @A+DPTR
      ACALL DISPLAY1
      CLR A
      MOV R0, #0H
INNER_LOOP: 
            MOVC A, @A+DPTR
            ACALL DISPLAY2
            INC R0
            MOV A, R0
            CJNE R0, #0AH, INNER_LOOP
       INC R1
       MOV A, R1
       CJNE R1, #0AH, LOOP
      JMP EXIT

DISPLAY1: MOV P1, A
          RET
DISPLAY2: MOV P0, A
          RET
         

EXIT:
END