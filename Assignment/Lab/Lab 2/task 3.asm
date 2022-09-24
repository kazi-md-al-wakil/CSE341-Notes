.MODEL SMALL
.STACK 100H
.DATA  

    b DB "ENTER A HEX DIGIT: $"    
    c DB "IN DECIMAL IT IS : 1$"

    
.CODE
MAIN PROC
    
MOV AX,@DATA
MOV DS,AX 

  LEA DX, b
  
  MOV AH,9
  INT 21H 
  
  
  MOV AH, 1
  INT 21H
  
  SUB AL, 11H 
  
  MOV BL, AL
  
  ; Next Line String
  MOV AH, 2
   
  MOV DL, 0DH
  INT 21h
  MOV DL, 0AH
  INT 21H    
  LEA DX, c
  
  MOV AH,9
  INT 21H
  ;--------
    
  MOV DL, BL
  MOV AH, 2
  INT 21H
  
   
           

MOV AX,4C00H
INT 21H

MAIN ENDP
END MAIN