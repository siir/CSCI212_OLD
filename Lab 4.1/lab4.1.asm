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
arrayB BYTE 12h, 34h, 56h, 78h, 9Ah, 0BCh, 0DEh, 0F0h, 0Fh, 0EDh, 0CBh, 0A9h, 87h, 65h, 43h, 21h

.code
main proc
	mov esi, OFFSET arrayB		; set ESI register to point to the address of arrayB
	mov ecx, SIZEOF arrayB		; set ECX register equal to the byte size of arrayB

								; BEGIN LOOP
L1:
	mov eax, SIZEOF arrayB		; copy byte size of arrayB into eax
	sub eax, ecx				; subtract ECX from EAX - value is how many bytes from the begining to switch

	mov bl, [esi+eax]			; copy this byte to BL register
	xchg bl, [esi+eax+1]		; exchange BL and next byte
	mov [esi+eax],bl			; copy the next byte that is now in BL into this byte's position

	dec ecx						; decrement count down register an extra time to skip the next byte

	LOOP L1						; END LOOP

	invoke ExitProcess,0
main endp
end main