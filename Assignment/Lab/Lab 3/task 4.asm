.MODEL SMALL
.STACK 100H
.DATA  

    b DB "ENTER SIDE1: $"    
    c DB "ENTER SIDE2: $"
    d DB "ENTER SIDE3: $"  
    e DB "Equilateral Triangle  $"
    f DB "Isosceles Triangle   $"
    g DB "Neither $"

    
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
  
  ;3rd Input
  MOV AH, 2
   
  MOV DL, 0DH
  INT 21h
  MOV DL, 0AH
  INT 21H  
    
  LEA DX, d 
  MOV AH,9
  INT 21H 
  
  MOV AH,1
  INT 21H
  
  SUB AL, 30H
  MOV CH, AL
  ;End of input
  
  
  CMP BH, BL ;checking 2 side
  JE thirdSideEqualCheck1 ;if 2 sides are equal check for 3rd side
  CMP BH, CH   ;if BH!=BL then check if BH == CH  
  JE Iso    ; BH != BL but BH == CH so, Isosceles Triangle
  CMP BL, CH ; If BH != BL also BH != CH, then checking if BL == CH
  JE Iso     ; If BH != BL and BH != CH but BL == CH so, Isosceles Triangle
  JMP Neither           ; If BH != BL and BH != CH also BL != CH So, the triangle is neither equilateral nor isosceles 
  
  
  thirdSideEqualCheck1: ;3 sides are equal or not
    CMP BH, CH
    JE Eq
    JMP ISO
     
  Eq:    ;Equilateral Triangle
    MOV AH, 2
    MOV DL, 0DH
    INT 21h
    MOV DL, 0AH
    INT 21H
    LEA DX, e
    MOV AH,9
    INT 21H
    JMP FINAL
  Iso:  ;Isosceles Triangle 
    MOV AH, 2
    MOV DL, 0DH
    INT 21h
    MOV DL, 0AH
    INT 21H
    LEA DX, f
    MOV AH,9
    INT 21H
    JMP FINAL
  Neither:
    MOV AH, 2
    MOV DL, 0DH
    INT 21h
    MOV DL, 0AH
    INT 21H
    LEA DX, g
    MOV AH,9
    INT 21H
    JMP FINAL  
           

  FINAL:
    MOV AH,4CH
    INT 21H
    MAIN ENDP

END MAIN