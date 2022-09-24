.model small
.stack 100h
.data
   b DB " Palindrome$"
   c DB " Not Palindrome$"
   num1 dw ?
   num2 dw ?
   num3 dw ?
   
.code
main proc
    mov ax,@data
    mov ds, ax
    ;--------
    mov cx,6
    mloop:
        mov ah,1
        int 21h
        mov bl, al
        push bx
        loop mloop
    pop bx  
    mov num1, bx     ;1
    pop cx  
    mov num2, cx    ;2
    pop dx  
    mov num3, dx  ;4
    pop dx       ;3
    pop cx     ;2
    pop bx   ;1
   
    cmp bx, num1
    JE loop2
    JNE not_print
    
    loop2:
 
        cmp cx, num2
        JE loop3
        JNE not_print
        
    loop3:    
        cmp dx, num3
        JE print
        JNE not_print
        

    print:
        LEA DX, b
        MOV AH,9
        INT 21H
        JMP exit
       
    not_print:
        LEA DX, c
        MOV AH,9
        INT 21H      

    ;--------
    EXIT:
        mov ax,4C00h  
        int 21h
        main endp
   

end main