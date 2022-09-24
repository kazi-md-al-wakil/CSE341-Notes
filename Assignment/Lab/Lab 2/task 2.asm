.MODEL SMALL
.STACK 100H
.DATA  

    b DB "ENTER NUM1: $"    
    c DB "ENTER NUM2: $"
    d DB "THE RESULT IS: $"

    
.CODE
MAIN PROC
    
MOV AX,@DATA
MOV DS,AX

  ; FIrst input 

  LEA DX, b
  MOV AH,9
  INT 21H  
  
  MOV AH,1
  INT 21H
  
  SUB AL, 30H
  MOV BL, AL
  
  ;2nd Input
  MOV AH, 2
   
  MOV DL, 0DH
  INT 21h
  MOV DL, 0AH
  INT 21H  
    
  LEA DX, c 
  MOV AH,9
  INT 21H 
  
  MOV AH,1
  INT 21H
  
  SUB AL, 30H
  MOV BH, AL
  
  
  ;Output
  MOV AH, 2
   
  MOV DL, 0DH
  INT 21h
  MOV DL, 0AH
  INT 21H  
    
  LEA DX, d 
  MOV AH,9
  INT 21H
  
  
  ADD BL, BH
  ADD BL, 30H
  MOV DL, BL
  MOV AH, 2
  INT 21H
           

MOV AX,4C00H
INT 21H

MAIN ENDP
END MAIN