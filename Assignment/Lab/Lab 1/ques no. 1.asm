.MODEL SMALL
.STACK 100H
.DATA

.CODE

    MAIN PROC     
        
        MOV AX , 06FH
        MOV BX , 021H
        MUL BX
        
    MAIN ENDP       
    
END MAIN
          