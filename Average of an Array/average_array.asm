; multi-segment executable file template.

data segment
    ; add your data here!

    SAYILAR Db 3,1,1,4,3,5,8,3 
    Toplam db 0
    Ortalama db 0
    
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
  mov dl, [bx + di] ;dizinin gerekli elemani alinir
  add [Toplam],dl   ;Toplam degiskenine eklenir  
  inc di 
  cmp cl,0
  dec cl ;counter 1 azalt
  jnz jump ;counter 0 olana kadar dallan
  ends
  
  ;Toplami bulduk simdi ortalamayi bulalim
  
  mov al,Toplam
  mov ah,0 ;Hata verdigi icin ah'i sifirlamak zorunda kaldim
  mov dl,8
  div dl
  mov [Ortalama],al
  

ends

end start ; set entry point and stop the assembler.
