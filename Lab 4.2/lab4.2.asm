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
	mov ecx, LENGTHOF arrayW
	mov esi, OFFSET arrayW
	mov edi, OFFSET arrayD

L1:
	mov eax, LENGTHOF arrayW
	sub eax, ecx
	imul eax, TYPE arrayW

	mov bx, [esi+eax]
	movzx edx, bx
	mov [edi+eax], edx

	LOOP L1

	invoke ExitProcess,0
main endp
end main