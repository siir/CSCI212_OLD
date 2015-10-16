; Program Name:           lab.7.1.asm

; Program Description: Implement the following C++ expression in assembly 
;						language, using 32-bit unsigned operands:
;						val1 = (val2 * val3) / (val4 - 3)
; Author: Chad Dreier
; Date: 10/1/2015


INCLUDE Irvine32.inc

.data
; val variables
	val1 DWORD ?
	val2 DWORD 10
	val3 DWORD 2
	val4 DWORD 5

.code
main PROC 
	
	; (val2 * val3)
	mov eax, val2
	mul val3

	; (val4 - 3)
	mov ecx, val4
	sub ecx, 3

	; clear dividend
	mov edx, 0

	; divide product of left side by right side
	div ecx

	; store answer into val1
	mov val1, eax

	exit
main ENDP
end main