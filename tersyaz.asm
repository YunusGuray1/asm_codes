DOSSEG

DGROUP GROUP DATASEG, STACKSEG

DATASEG SEGMENT PARA PUBLIC 'DATA'
    mesaj db 'Metin giriniz: $'
DATASEG ENDS

STACKSEG SEGMENT PARA STACK 'STACK'
    dw 100 dup(?)
STACKSEG ENDS

CODESEG SEGMENT PARA PUBLIC 'CODE'
    ASSUME CS:CODESEG, DS:DGROUP, SS:STACKSEG

ANA PROC FAR

    mov ax, DGROUP
    mov ds, ax

    mov ah, 09h
    lea dx, mesaj
    int 21h                 ;üstte data segmentte mesaji tanimladi burda mesajı dx e yazdirip printledi

    xor cx, cx              ; karakter sayacı     ( burda cx sıfırlaniyor sub cx,cx vs vs de yapabilirsin cok takilma buna )

OKU:
    mov ah, 01h
    int 21h                 ; AL = karakter

    cmp al, 0Dh             ; Enter?      (girilen karakter 'ENTER' oldugunda YAZDIR a  geciyor)
    je YAZDIR

    xor ah, ah              ;bu gene ah ici sifirlama (sub ah,ah)
    push ax                 ; karakteri stack'e koy
    inc cx                  ;her ziplamada cx 1 artıyor karakter kadarda zipliyor string uzunlugu tutuyor yani

    jmp OKU

YAZDIR:
    mov ah, 02h

TEKRAR:
    cmp cx, 0               ;UZUNLUK == 0 ISE TERKET
    je CIKIS

    pop dx                  ; DL = karakter  stacke sirayla pushladigin karakteri poplayınca ters oluyor ztn otomatik
    int 21h                 ;pop dx diyince dx e yazdrdi stackten çikan degerii ah ustte 2 idi ztn print yapti

    dec cx
    jmp TEKRAR

CIKIS:              ;buraya takilma bitiriyor sadcee dosboxa ozel biey bu ret desende bitiyor ztn
    mov ah, 4Ch
    int 21h

ANA ENDP

CODESEG ENDS
END ANA
