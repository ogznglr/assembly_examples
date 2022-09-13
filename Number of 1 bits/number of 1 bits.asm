; multi-segment executable file template.

data segment
     counter db 0
ends


code segment
start:
; set segment registers:
    mov ax, data
    mov ds, ax
    mov es, ax

    ; add your code here
            
    mov cx, 8
    mov ah,0                
    mov al,01010010b
    dongu:
        shr al,1
        jc deger1
        jmp deger0
        
        deger1:
        inc [counter]
        
        deger0:
    loop dongu
        
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.
