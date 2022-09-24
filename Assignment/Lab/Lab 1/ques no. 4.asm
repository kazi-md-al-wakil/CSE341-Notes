.MODEL SMALL
.STACK 100H
.DATA

.CODE

    MAIN PROC     
    MOV AL, 01H
    MOV BL, 02H
    ADD AL, BL ;(1+2=3=AL)
    MOV BL, 03H
    MOV AH, 01H
    SUB BL, AH ;(3-1=2=BL)
    MUL BL ;(3*2=6=AL)
    MOV BX, 0305H
    DIV BL ;(6/5 -> AH= 01(Remainder), AL = 01(Quotient))
    ADD AL, BH ;(AL+BH=01+03=04=AL)
    
    
END MAIN
          