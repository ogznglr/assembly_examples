; multi-segment executable file template.

data segment 
    ad db 'Mert'
    tersad db 4 dup(?)
    
ends

code segment
start:
; set segment registers:
    mov ax, data
    mov ds, ax
    mov es, ax

    ; add your code here
    
    mov cx, 4
    mov bx, offset ad
    mov bp, offset tersad
    
    mov di,0 
    mov si,3
    
    dongu:  
        mov al, [bx+di]
        mov [bp+si], al
        dec si
        inc di
    loop dongu
            
  ret    
ends

end start ; set entry point and stop the assembler.
