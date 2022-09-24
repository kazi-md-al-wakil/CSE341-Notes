.model small
    power macro a1,a2
        mov cx, 00h 
        mov cl, a2
        mov al, 01H

        m1loop:
            mul a1
            loop m1loop
        mov dx, ax
    power endm        
        
.stack 100h
.data
.code 
main proc
    mov ax,@data
    mov ds, ax
    ;--------
    mov ah,1
    
    ;n^m
    int 21h
    mov bl, al
    sub bl,30h ; bl=n
    
    int 21h
    mov bh,al ;bh=m
    sub bh,30h 
    
    power bl, bh 
    
    add dx, 30h
     
    mov ah, 2
    int 21h
    ;--------
    EXIT: 
        mov ax,4C00h  
        int 21h
        main endp
    

end main