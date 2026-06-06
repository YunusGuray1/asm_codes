kod segment
assume cs:kod

basla:

    mov ah,01h
    int 21h
    ; Karakter oku
    ; ASCII kodu AL'de


    xor ah,ah
    ; AH SIFIRLANDI DEGER AL DEYDI ZTN AX = ASCII kodu OLDU

    mov bl,100
    div bl
    ; AX'i 100'e böl  125/10
        ;
    ; AL = yüzler basamağı 100
    ; AH = kalan 25

    mov bh,al
    ; yüzler basamağını sakla bh=100

    mov al,ah  ; al=25
    xor ah,ah
    ; kalan değeri tekrar AX'e koy gene üstteki gibi ah bosalt al = ax olsun

    mov bl,10
    div bl
    ; kalan / 10  25/10
    ;
    ; AL = onlar basamağı 2
    ; AH = birler basamağı 5

    mov ch,al  ;ch = 2
    mov cl,ah  ; cl = 5
    ; onlar ve birleri sakla

    ; yüzler basamağı varsa yaz

    cmp bh,0
    je onlar  ; yuzler basamagı bhde idi bosmu diye kontrol etti bossa onlar a atlar

    mov dl,bh
    add dl,30h  ;1 + 30h = 31h 1'in ascii kodu
    mov ah,02h
    int 21h

onlar:

    ; yüzler yazıldıysa onlar da yazılmalı
    cmp bh,0        ;daha oce yuzler yazildi mi kontrol
    jne yaz_onlar

    ; yüzler yoksa onlar 0 mı?
    cmp ch,0        ;10lar basildi mi kontrol
    je birler

yaz_onlar:
    mov dl,ch
    add dl,30h
    mov ah,02h
    int 21h

birler:

    mov dl,cl
    add dl,30h
    mov ah,02h
    int 21h

    mov ah,4Ch
    int 21h

kod ends
end basla
