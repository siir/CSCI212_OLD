; Program Name:           sandbox.asm

; Program Description: test different things
; Author: Chad Dreier
; Date: 9/3/2015


INCLUDE Irvine32.inc

.data
aname BYTE "A","B","E"

.code
main proc
test  al,0
	 mov edx,1
   mov eax,7FFFh
   cmp eax,0FFFF8000h
   jl  L2
   mov edx,0
L2:

mov edx,1   
   mov eax,7FFFh
   cmp eax,8000h
   jb  L1
   mov edx,0
L1:

mov bx,29D6h
xor bx,8181h

mov bx,0649Bh
or  bx,3Ah

; question 4
mov bx,0FFFFh
and bx,6Bh

; question 5
mov bx,649Bh
xor bx,0FFFFh
	exit
main endp
end main