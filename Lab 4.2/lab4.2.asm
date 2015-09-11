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

.code
main proc

	invoke ExitProcess,0
main endp
end main