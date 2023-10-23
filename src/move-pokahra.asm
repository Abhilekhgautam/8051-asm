
ORG 250H
mydata: DB 'Pokhara', 0

ORG 0000H
MOV DPTR, #mydata
MOV R0, #07H
MOV R1, #50H
lOOP: CLR A
      MOVC A, @A+DPTR
      INC DPTR
      INC R1
      DJNZ R0, LOOP
END
