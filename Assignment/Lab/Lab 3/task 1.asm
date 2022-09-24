.MODEL SMALL
.STACK 100H
.DATA
    b DB " ENTER NUM: $"    
    c DB "->MEAN:  $"
.CODE
MAIN PROC
    
MOV AX,@DATA
MOV DS,AX  
    
    MOV CL, 01H
    loop1:    
        ;string print b
        LEA DX, b
        MOV AH,9
        INT 21H  
        ;Input taking
        MOV AH,1
        INT 21H
        ;Corresponding HEX 
        SUB AL, 30H
        MOV CH, AL
        
        INC CL
        
 
        ;Division
        MOV BL, 02H
        MOV AH, 00H
        DIV BL
        
        ;comparing
        CMP AH,00h
        JE EVEN
        CMP CL, 04H
        JL loop1
        JGE MEAN 

    EVEN:
        ADD BH, CH
        CMP CL, 04H
        JL loop1
        
    MEAN:
        MOV AL, BH
        MOV AH, 00H
        MOV BX, 02H
        DIV BL
        MOV CL, AL
        
    ;output
    
    LEA DX, c
    MOV AH,9
    INT 21H
    MOV CH, 00H    
    ADD CL, 30H
    MOV DL, CL
    MOV AH, 2
    INT 21H
           
        
    JMP FINAL
    
    
    
    
  
  
    FINAL:
    MOV AH,4CH
    INT 21H
    MAIN ENDP

END MAIN