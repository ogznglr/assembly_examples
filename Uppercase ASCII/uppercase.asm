; multi-segment executable file template.

data segment 
         
         
     
    
    
ends

code segment
start:
; set segment registers:
    mov ax, data
    mov ds, ax
    mov es, ax

    ; add your code here
    mov al,'g'
    and al,11011111b
            
     
ends

end start ; set entry point and stop the assembler.
