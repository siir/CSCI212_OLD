; Program Name:           lab.7.1.asm

; Program Description: Implement the following C++ expression in assembly 
;						language, using 32-bit unsigned operands:
;						val1 = (val2 * val3) / (val4 - 3)
; Author: Chad Dreier
; Date: 10/1/2015


INCLUDE Irvine32.inc

.data

val1 DWORD ?
val2 DWORD 10
val3 DWORD 2
val4 DWORD 5

solution DWORD 2 DUP(?)

.code
main PROC 
	
	mov eax, val2
	mul val3
	;mov product, eax
	;mov [product+8],edx

	mov ecx, val4
	sub ecx, 3

	mov edx, 0
	div ecx

	mov [solution], eax
	mov [solution+8],edx


	exit
main ENDP
end main