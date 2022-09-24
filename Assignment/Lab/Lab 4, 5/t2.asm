.model small
.stack 100h
.data
    a db 5 dup(0)
.code
main proc
    mov ax,@data
    mov ds, ax
    
    mov cx,5
    mov si,0
    mloop:
        mov ah,1
        int 21h
        mov a[si], al
        add si, 1
        loop mloop
    mov ah, 2
    
    mov cx, 5
    mov si,4
    print:
        mov dl, a[si]
        int 21h
        sub si, 1
        loop print
    EXIT: 
        mov ax,4C00h  
        int 21h
        main endp
    

end main
