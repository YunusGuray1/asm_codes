dhex segment

  assume cs:dhex

  mov bx,65
  mov ch,4h ;rakam adedi

  mov cl,4h ;bit say

dondur:
  rol bx,cl 
  mov al,bl
  and al,0fh
  add al,30h
  cmp al,3ah
  jl ekrana
  add al,07h


ekrana:
  mov dl,al
  mov ah,2
  int 21h
  
  dec ch
  jnz dondur

  int 22h

dhex ends

end
