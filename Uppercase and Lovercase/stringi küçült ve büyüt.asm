; multi-segment executable file template.

data segment
    str db 'turkiye'
ends


code segment
start:
; set segment registers:
    mov ax, data
    mov ds, ax
    mov es, ax

    ; add your code here
            
    mov bx, offset str
    mov di,0
    mov cx, 14
    
    dongu:
        
        mov al, [bx + di]
        xor al, 00100000b
        mov [bx + di],al
        inc di
        cmp di,7
        jne devam
        mov di,0
        devam:
    loop dongu
        
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.
