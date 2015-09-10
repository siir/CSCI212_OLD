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

.code
main proc
	mov eax, DWORD PTR bigEndian	; copy bigEndian from memory as its stored (effectively reversing it)
	mov littleEndian, eax			; store in littleEndian variable

	invoke ExitProcess,0
main endp
end main