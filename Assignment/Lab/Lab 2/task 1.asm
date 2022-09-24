.MODEL SMALL
.STACK 100H
.DATA
    a DB "This is my first message using assembly!$"
    
.CODE
MAIN PROC
    
MOV AX,@DATA
MOV DS,AX
  ; DISPLAYING '&'
  MOV AH,1
  INT 21H
  
  MOV DL,AL
  
  MOV AH,2
  INT 21H
  ;---------------  
  
  ;DISPLAYING STRING
  
  LEA DX, a
  
  MOV AH,9
  INT 21H
  
  

MOV AX,4C00H
INT 21H

MAIN ENDP
END MAIN