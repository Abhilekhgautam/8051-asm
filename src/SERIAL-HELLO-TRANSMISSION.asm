;transmit continually the string  "Hello" serially at 9600 baud rate with 8 bit data and 1
;stop bit.

ORG 0350H
MYDATA: DB 'HELLO', 0

ORG 0000H

MOV TMOD, #20H ; SET THE TIMER TO MODE 0
MOV TH1, #0FDH ; 9600 BAUD RATE
MOV SCON, #50H ; MODE 0
MOV DPTR, #MYDATA ; DPTR NOW POINTS TO LOCATION 850H
MOV R7, #05H   ; SET THE COUNTER TO LENGTH OF TEXT TO BE SENT
SETB TR1       ; START THE TIMER

LOOP: CLR A
      MOVC A, @A+DPTR
      INC DPTR
      ACALL SEND
      DJNZ R7, LOOP

SEND: MOV SBUF, A
SAME: JNB TI, SAME ; POLL THE TI PIN
      CLR TI
      RET
END
      

