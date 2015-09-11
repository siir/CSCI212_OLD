; Program Name:           lab3.1.asm

; Program Description: Write a program that uses the variables below and MOV instructions to 
;						copy the value from bigEndian to littleEndian, reversing the order of 
;						the bytes. The number’s 32-bit value is understood to be 12345678 
;						hexadecimal.
; Author: Chad Dreier
; Date: 9/3/2015

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
bigEndian BYTE 12h,34h,56h,78h
littleEndian DWORD 0				
END_OF_LITTLE = $-1					; Address of littleEndian ending BYTE

.code
main proc
	; moves first byte of bigEndian to end of littleEndian
	; moves bigEndian pointer forward and littleEndian pointer backwards

	mov esi, OFFSET bigEndian		; Move ESI register to address of bigEndian start
	mov edi, END_OF_LITTLE			; Move EDI register to address of littleEndian end

	mov ecx, LENGTHOF bigEndian		; Set loop counter (ECX register) to length of bigEndian

L1:
	mov al, [esi]					; Copy first BYTE into AL register
	mov [edi], al					; Copy AL register to memory at EDI

	inc esi							; Move ESI up a BYTE 
	dec edi							; Move EDI down a BYTE
	LOOP L1							; Loop until all bigEndian BYTEs are processed

	; Check work
	mov eax, DWORD PTR bigEndian
	mov ebx, DWORD PTR littleEndian

	invoke ExitProcess,0
main endp
end main