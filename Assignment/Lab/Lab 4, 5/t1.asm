.model small
.stack 100h
.data
    
.code
main proc
    mov ax,@data
    mov ds, ax
    
    mov bx, 01h
    Mov dl, 01h
    mov cx,6
    mov ah, 2
    
    sum: 
        cmp bx, 0Dh
        je addX
        add bx, 03h
        cmp bx, 0Dh
        add dx, bx
        loop sum
        jmp print
    addX:
        add bx,06h
        jmp sum
        
    print:
        int 21h
        jmp exit
        
    
    EXIT: 
        mov ax,4C00h  
        int 21h
        main endp
    

end main
