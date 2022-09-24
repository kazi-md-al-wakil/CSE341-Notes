.model small
    ;if working with methods
    
    ;methodName macro a1,a2
          ;write codes here
    ;methodName endm           
.stack 100h 

.data 
    ;if working with array
    ;a DB 5 dup(0) 
    
    ;if there is string output 
    ;c DB " Not Palindrome$"  
     
    ;when to take num1 as a variable
    ;num1 dw ?
.code 


main proc
    mov ax,@data
    mov ds, ax
    ;--------    
    ;write your code here
    ;taking input 
    mov ah,1
    int 21h

    ;--------
    EXIT: 
        mov ax,4C00h  
        int 21h
        main endp
    

end main