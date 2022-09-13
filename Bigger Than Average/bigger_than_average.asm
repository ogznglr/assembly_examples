; multi-segment executable file template.

data segment
    ; add your data here!

    SAYILAR Db 3,1,1,4,3,5,8,3 
    Counter db 0
    Ortalama db ?
    Toplam db 0
    
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
  
  mov cl,8 
  mov di,0
  jump2: ;Ortaladan buyuk olan sayilari tespit edelim
   mov dl, [bx + di]
   
   cmp dl,[Ortalama] ;baktigimiz eleman ortalamadan buyuk mu?
   jle less
   inc [Counter] ;Ortalamadan buyukse counter artsin
   
   less:
   inc di 
   cmp cl,0
   dec cl ;counter 1 azalt
  jnz jump2 ;counter 0 olana kadar dallan

ends

end start ; set entry point and stop the assembler.
