.model small
    power macro a1
        loop2:
            mov bh, a1
            cmp a1, bh
            jg bigger
        
        bigger:
            mov bh, a1

    power endm        
        
.stack 100h
.data
    a db 1, 3, 5, 7, 8
.code 
main proc
    mov ax,@data
    mov ds, ax
    ;--------
    mov cx, 5
    mov si, 0
    loop1:
        power bl, a[si]
        add si, 01h
        loop loop1 
    

    ;--------
    EXIT: 
        mov ax,4C00h  
        int 21h
        main endp
    

end main