; multi-segment executable file template.

data segment
    ; add your data here!

    SAYILAR Db 3,1,18,4,2,5,8,3 
    Counter db 0
    
ends


code segment
start:     
  ;Data segmet baglama
  mov ax,@data
  mov ds,ax
  mov es,ax
  
  mov bx,offset SAYILAR ;dizinin offset adresini aldik
  mov cl,8 ;dizi 8 elemanli oldugundan counter 8
  mov di,0
  jump: 
  mov al, [bx + di] ;dizinin gerekli elemani alinir
  mov ah,0
  mov dl,2 
  
  div dl
  
  cmp ah,0
  
  jnz tek ;sayimiz 2'ye tam bolunmuyor yani tek
  
  inc [Counter]  ;cift ise Counter'i arttir
  
  tek: ;tek ise hicbir sey yapma
  
  inc di 
  cmp cl,0 ;counter 0 oldu mu?
  dec cl ;counter 1 azalt
  jnz jump ;counter 0 olana kadar dallan
  
ends


ends

end start ; set entry point and stop the assembler.
