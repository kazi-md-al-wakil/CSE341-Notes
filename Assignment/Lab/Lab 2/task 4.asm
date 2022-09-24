.MODEL SMALL
.STACK 100H
.DATA  

    b DB "ENTER NUM1: $"    
    c DB "ENTER NUM2: $"
    d DB "The sum of $"
    e DB " and $"
    f DB " is $"
    g DB "First Number: $"
    h DB "Second Number: $"

    
.CODE
MAIN PROC
    
MOV AX,@DATA
MOV DS,AX

  ;Displaying "?"
  MOV AH,1
  INT 21H
  
  MOV BL,AL
  
  MOV AH, 2 
  MOV DL, 0DH
  INT 21h
  MOV DL, 0AH
  INT 21H
  MOV DL, BL
  INT 21H
  
  MOV AH, 2 
  MOV DL, 0DH
  INT 21h
  MOV DL, 0AH
  INT 21H

  ; FIrst input 

  LEA DX, b
  MOV AH,9
  INT 21H  
  
  MOV AH,1
  INT 21H
  
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

  MOV BH, AL
  
  
  ;Output
  
  
  ;---------
  
  MOV AH, 2
   
  MOV DL, 0DH
  INT 21h
  MOV DL, 0AH
  INT 21H  
    
  LEA DX, g   ; first number
  MOV AH,9
  INT 21H
  
  MOV DL, BL
  MOV AH, 2
  INT 21H
  
  MOV AH, 2
   
  MOV DL, 0DH
  INT 21h
  MOV DL, 0AH
  INT 21H  
    
  LEA DX, h    ;second number
  MOV AH,9
  INT 21H
  
  MOV DL, BH
  MOV AH, 2
  INT 21H
  ;--------- 
  
  MOV AH, 2
   
  MOV DL, 0DH
  INT 21h
  MOV DL, 0AH
  INT 21H
  
  LEA DX, d ;The sum of 
  MOV AH,9
  INT 21H
  
  MOV DL, Bl
  MOV AH, 2
  INT 21H
  
  LEA DX, e ;and 
  MOV AH,9
  INT 21H
  
  MOV DL, BH
  MOV AH, 2
  INT 21H
  
  LEA DX, f ;is
  MOV AH,9
  INT 21H

  ADD BL, BH
  SUB BL, 30H
  MOV DL, BL
  MOV AH, 2
  INT 21H
           

MOV AX,4C00H
INT 21H

MAIN ENDP
END MAIN