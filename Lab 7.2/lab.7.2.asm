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
input BYTE 0B1h ; 10110001b
output BYTE 8 DUP (?)

.code
main PROC 

	mov eax, 0
	mov ebx, 0
	mov ecx, 0
	mov edx, 0

	mov al, input
	call showDecimal

	exit
main ENDP



;---------------------------------------
; showDecimal
;
; Writes decimal value of an unsigned
;   8 bit number
; Receives:
;	AL: 8 bit unsigned value to output
; Returns:
;	nothing
;---------------------------------------
showDecimal PROC

	mov esi, OFFSET output
	mov cl, 8
	mov bl, 1d
LOOP0:
	;mov dl, 8
	;sub dl, cl
	 
	shr al, 1
	JNC CF0

CF1:
	mov [esi], bl
	jmp NXT

CF0:
	mov [esi], 0

NXT:
	;call WriteChar
	
	inc esi
	shl bl, 1
	loop LOOP0

	mov cl, 8
LOOP1
	mov bl, esi


	loop LOOP1
	ret
showDecimal ENDP

end main