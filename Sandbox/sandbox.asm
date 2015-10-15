; Program Name:           sandbox.asm

; Program Description: test different things
; Author: Chad Dreier
; Date: 9/3/2015


INCLUDE Irvine32.inc

.data
aname BYTE "A","B","E"

.code
main proc

mov ebx, 0
mov bx,5
stc
mov ax,60h
adc bx,ax



	exit
main endp
end main