; boot.asm
[BITS 16]
[ORG 0x7C00]

; Print a "Hello" message
mov ah, 0x0E
mov al, 'H'
int 0x10
mov al, 'e'
int 0x10
mov al, 'l'
int 0x10
mov al, 'l'
int 0x10
mov al, 'o'
int 0x10

; Infinite loop
jmp $

times 510 - ($ - $$) db 0
dw 0xAA55
