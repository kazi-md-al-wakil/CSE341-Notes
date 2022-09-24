.model small         
.stack 100h 
.data
    a db 3 dup(0)
    str dw " NotFound$" 
.code 

main proc
    mov ax,@data
    mov ds, ax
    ;--------    
    mov cx,3
    mov si,0
    mloop:
        mov ah,1
        int 21h
        mov a[si], al
        add si, 1
        loop mloop
    
    mov cx, 3
    mov bl, 00h
    mov si, 0
    mov bh, 02h
    mov ah, 00h
    mov dx,00h
    
    loop1:
       mov al, a[si]
       div bh
       cmp ah, 01h
       je printingTheOdd
       jne addingjust
       add si, 1
       loop loop1
    checking:
        cmp bl, 03h
        je printNotf
    
    
    printNotf:
        Lea dx, str
        mov ah, 9
        int 21h
        jmp exit
           
    
    addingjust:
        add bl, 01h
        add si, 01h
        sub cx, 01h
        cmp cx, 00h
        jg loop1
        je checking
        
            
    printingTheOdd:
         mov dl, a[si]
         add si, 1
         mov ah, 2
         int 21h
         jmp exit
         
    ;--------
    EXIT: 
        mov ax,4C00h  
        int 21h
        main endp
    

end main