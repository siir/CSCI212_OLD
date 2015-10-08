; Program Name:           lab.asm

; Program Description: Write a procedure that displays an unsigned 8-bit binary value in 
;						decimal format. Pass the binary value in AL. The input range is 
;						limited to 0 to 99h. The only procedure you can call from the book’s 
;						link library is WriteChar. Here is a sample call:
;
;							mov  al,65h       ; range limit: 0 to 99h 
;							call showDecimal8
;
;						The output from the above would be 65.
;
; Author: Chad Dreier
; Date: 10/1/2015


INCLUDE Irvine32.inc

.data
input BYTE 65h
output WORD ?

cnt WORD 0

.code
main PROC 
	
	mov al, input
	mov esi, OFFSET output
	call showDecimal

	exit
main ENDP

showDecimal PROC
	
LOOP0: 
	shl eax, 1
	mov BYTE PTR [esi], '0'
	jnc LOOP1
	mov BYTE PTR [esi], '1'
LOOP1:
	inc esi
	loop LOOP0
	
	ret
showDecimal ENDP

end main