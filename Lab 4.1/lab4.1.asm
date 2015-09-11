; Program Name:           lab4.1.asm

; Program Description: Write a program with a loop and indexed addressing that exchanges every 
;						pair of values in an array with an even number of elements. Therefore, 
;						item i will exchange with item i+1, and itemi+2 will exchange with 
;						item i+3, and so on.
; Author: Chad Dreier
; Date: 9/10/2015

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
arrayB BYTE 12h, 34h, 56h, 78h, 90h, 12h, 34h, 56h, 78h, 90h

.code
main proc
	mov esi, OFFSET arrayB
	mov ecx, SIZEOF arrayB

L1:
	mov eax, SIZEOF arrayB
	sub eax, ecx

	mov bl, [esi+eax]
	xchg bl, [esi+eax+1]
	mov [esi+eax],bl

	dec ecx

	LOOP L1

	invoke ExitProcess,0
main endp
end main