; Program Name:           lab4.2.asm

; Program Description: Write a program that uses a loop to copy all the elements from an unsigned 
;						Word (16-bit) array into an unsigned doubleword (32-bit) array.
; Author: Chad Dreier
; Date: 9/10/2015

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
arrayW WORD 1234h, 5678h, 9ABCh, 0DEF0h
arrayD DWORD 0h

.code
main proc
	mov ecx, LENGTHOF arrayW		; Set ECX register to size of array for L1 loop count down
	mov esi, OFFSET arrayW			; point ESI register to arrayW
	mov edi, OFFSET arrayD			; point EDI register to arrayD

									; BEGIN LOOP
L1:
	mov eax, LENGTHOF arrayW		; move length of arrayW to EAX
	sub eax, ecx 					; subtract the ECX register from EAX - result is how many words from the beginning to copy
	imul eax, TYPE arrayW			; multiply the word count by the size of arrayW to know where to copy from

	mov bx, [esi+eax]				; copy the correct word to BX register
	movzx edx, bx 					; copy to EDX register and zero extend the value
	imul eax, 2						; multiply the word count by 2 for dword count
	mov [edi+eax], edx 				; move the zero extended result of EDX register to the correct position in arrayD

	LOOP L1							; END LOOP

	invoke ExitProcess,0
main endp
end main