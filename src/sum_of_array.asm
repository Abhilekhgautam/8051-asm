ORG 0000H

; Finds the sum of values

MYDATA: DB 01H, 02H, 03H, 04H, 05H, 06H, 07H, 08H, 09H

MOV R0, #08H
MOV DPTR, #MYDATA
MOV A, #0H
MOV R1, #0H
MOV R2, #0H
LOOP: MOVC A, @A+DPTR
      ADD A, R1
      MOV R1,A
      INC R2
      MOV A, R2
      CJNE R2, #09H, LOOP
END 