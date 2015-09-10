; Program Name:           sandbox.asm

; Program Description: test different things
; Author: Chad Dreier
; Date: 9/3/2015

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data

arrayB BYTE 10h,20h,30h

.code
main proc

   mov esi,1
   mov al,arrayB[esi]

	invoke ExitProcess,0
main endp
end main