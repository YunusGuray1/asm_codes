dbin segment

  assume cs:dbin

  mov bx,65   ;41h
  mov ch,8h ;rakam adedi

  mov cl,1h ;bit say

dondur:
  rol bl,cl
  mov al,bl

  and al,1h
  add al,30h



ekrana:
  mov dl,al
  mov ah,2
  int 21h
  
  dec ch
  jnz dondur

  int 22h

dbin ends

end
