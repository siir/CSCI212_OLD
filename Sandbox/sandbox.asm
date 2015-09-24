; Program Name:           sandbox.asm

; Program Description: test different things
; Author: Chad Dreier
; Date: 9/3/2015


INCLUDE Irvine32.inc

.data
aname BYTE "A","B","E"

.code
main proc
	mov esi, OFFSET aname
	mov ecx, LENGTHOF aname

L1:
	mov al, [esi]
	inc esi
	push eax
	LOOP L1

	
	mov esi, OFFSET aname
	mov ecx, LENGTHOF aname

L2:
	pop eax
	mov [esi], al
	inc esi
	LOOP L2

	exit
main endp
end main