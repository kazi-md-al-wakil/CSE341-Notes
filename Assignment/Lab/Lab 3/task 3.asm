.MODEL SMALL  
.STACK 100H  
.DATA
    num db ?
    b db "Number: $" 
    c db "A Prime Number.$"
    d db "Not a Prime Number.$"
    
    
.CODE
MAIN PROC
        
MOV AX, @DATA
MOV DS, AX
	   ;input taking
       LEA DX, b
       MOV AH, 9
       INT 21H    
       
       MOV AH, 1
       INT 21H     
        
       SUB AL, 30H   ;corresponding Hex Number
       MOV num, AL   
	   
	   CMP num, 1
	   JLE NOTPRIME ; numbers <=1 are not primes such as 0 and 1
	   
	   MOV CX,2
	   
	   MOV AX,0   
	   MOV DX,0
	   MOV AL,num
	   DIV CX
	   
	   MOV CX,AX              
	   
	PRIMEorNot:
	   CMP CX,1
	   JLE PRIME
	   
	   MOV AX,0
	   MOV DX,0
	   MOV AL, num               
	   DIV CX
	    
	   DEC CX
	   CMP DX,0
	   JE NOTPRIME
	   JMP PRIMEorNot
	   
	PRIME:
	   ;line break
	   MOV AH,2 
       MOV DL,0DH 
       INT 21H
       MOV DL,0AH 
       INT 21H
          
	   LEA DX, c
       MOV AH, 9
       INT 21H 
	   JMP Final
	NOTPRIME: 
	   ;line break
	   MOV AH,2 
       MOV DL,0DH 
       INT 21H
       MOV DL,0AH 
       INT 21H 
         
	   LEA DX, d
       MOV AH, 9
       INT 21H  	   
	Final:	   	  	   
	  MOV AX, 4C00H
      INT 21H
      MAIN ENDP
END MAIN	   
			   
	



























