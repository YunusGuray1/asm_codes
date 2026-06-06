DOSSEG

DGROUP GROUP DATASEG, STACKSEG

DATASEG SEGMENT PARA PUBLIC 'DATA'
DATASEG ENDS

STACKSEG SEGMENT PARA STACK 'STACK'
    DW 100 DUP(?)
STACKSEG ENDS

CODESEG SEGMENT PARA PUBLIC 'CODE'
    ASSUME CS:CODESEG, DS:DGROUP, SS:STACKSEG

ANA PROC FAR

    mov ax,DGROUP
    mov ds,ax

OKU:
    mov ah,01h
    int 21h              ;karakteri girdin

    cmp al,0Dh          ;entersa cik
    je CIKIS

    ; 1 saniye bekle
    ;call BEKLE_1SN       dosboxta duzgun calismior ondan ugrasmadim beklemeyle cevirmeden karakteri * 'e 1 saniye bekliyormuş gibi hayal et

    ; imleci sola al
    mov dl,08h              ; 08h bildigin backspace, ekrana backspace basiyor burasi
    mov ah,02h
    int 21h

    ; karakteri sil
    mov dl,' '              ; bosluk basmis 20h ta yazilabilir ' ' yerine
    int 21h

    ; tekrar sola al
    mov dl,08h              ;gene backsapce
    int 21h

    ; yerine * yaz
    mov dl,'*'              ;2Ah da ayzılabilir '*' yerine
    int 21h

    jmp OKU

CIKIS:
    mov ah,4Ch              ;gene program bitisi takma
    int 21h

ANA ENDP


;--------------------------------------------------
; Yaklaşık 1 saniye gecikme BU KISIMIDA COK TAKMAAAA
;--------------------------------------------------
BEKLE_1SN PROC NEAR

    mov cx,18

TEKRAR:                             ;
    mov ah,86h
    mov cx,0000h
    mov dx,00F03h      ; ~55 ms
    int 15h

    loop TEKRAR

    ret

BEKLE_1SN ENDP

CODESEG ENDS
END ANA
