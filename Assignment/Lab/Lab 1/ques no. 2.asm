.MODEL SMALL
.STACK 100H
.DATA

.CODE

    MAIN PROC     
        
        MOV AX , 07F2H
        MOV BL , 012H
        DIV BL
        
    MAIN ENDP       
    
END MAIN
          