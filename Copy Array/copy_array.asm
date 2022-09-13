; multi-segment executable file template.

data segment
    sayilar db 2,3,5,7
    sayilar2 db 4 dup(?)
    
ends


code segment
start:
; set segment registers:
    mov ax, data
    mov ds, ax
    mov es, ax

    ; add your code here
    mov cx, 4
    mov bx, offset sayilar
    mov bp, offset sayilar2
    mov di,0
    dongu:
        mov al,[bx+di]
        mov [bp+di], al
        inc di
    loop dongu        
    
ends

end start ; set entry point and stop the assembler.
