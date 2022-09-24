.MODEL SMALL
.STACK 100H
.DATA

.CODE

    MAIN PROC     
        
        MOV AX , 01H
        MOV BX , 07H  
        XCHG AX, BX

END MAIN
          