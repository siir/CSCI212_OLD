; Program Name:           lab2.1.asm

; Program Description: Using the AddTwo program as a reference, write a program that calculates the following expression, 
;						A = (A + B) ? (C + D). Use registers to contain your values. Assign initial integer values to the 
;						EAX,EBX, ECX, and EDX registers.
; Author: Chad Dreier
; Date: 8/31/2015

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
valA DWORD 4
valB DWORD 2
valC DWORD 3
valD DWORD 1

.code
main proc
	; move initial values into registers
	mov	eax,valA
	mov ebx,valB
	mov ecx,valC
	mov edx,valD

	; add parens
	add	eax,ebx
	add ecx,edx

	; subtract sums
	sub eax,ecx

	; store end result back into value A
	mov valA,eax

	invoke ExitProcess,0
main endp
end main