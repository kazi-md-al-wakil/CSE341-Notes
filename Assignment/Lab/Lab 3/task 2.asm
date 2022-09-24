.MODEL SMALL
.STACK 100H
.DATA
    b DB "ENTER NUM: $"   
    c DB "Good Morning $"
    d DB "Good Afternoon $"
    e DB "Good Night $"   

.CODE
MAIN PROC
    
MOV AX,@DATA
MOV DS,AX  
    

    
        ;string print b
        LEA DX, b
        MOV AH,9
        INT 21H  
        ;Input taking(Intput from 25-48H, means their Co-responding ASCII values, then converting it to 1-24H)
        MOV AH,1
        INT 21H
        ;Corresponding HEX 
        CMP AL, 34
        JL minus24
        JGE minus1E
        
        minus24:
            SUB AL, 24H
            MOV BH, AL
        minus1E:
            SUB AL, 1EH
            MOV BH, AL     
            
        
        CMP BH, 12H
        JL GoodMorning
        JGE AafterMorning
        
        AafterMorning:
            MOV AH, 2
            MOV DX, 20H
            INT 21H
            CMP BH, 18H
            JL GoodAfternoon
            JGE GoodNight
        GoodMorning: 
            MOV AH, 2
            MOV DX, 20H
            INT 21H
            LEA DX, c
            MOV AH,9
            INT 21H
            JMP FINAL
        GoodAfternoon:
            MOV AH, 2
            MOV DX, 20H
            INT 21H
            LEA DX, d
            MOV AH,9
            INT 21H
            JMP FINAL
         GoodNight:
            MOV AH, 2
            MOV DX, 20H
            INT 21H
            LEA DX, e
            MOV AH,9
            INT 21H
            JMP FINAL     
  
  
    FINAL:
    MOV AH,4CH
    INT 21H
    MAIN ENDP

END MAIN