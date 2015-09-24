; Program Name:           lab5.1.asm

; Program Description: Write a program that displays the same string in four 
;						different colors, using a loop. Call the SetTextColor 
;						procedure from the book’s link library. Any colors 
;						may be chosen, but you may find it easiest to change 
;						the foreground color.
; Author: Chad Dreier
; Date: 9/17/2015


INCLUDE Irvine32.inc

.data
prompt BYTE "STRING ",0

.code
main PROC 
	mov ecx, 3h

COLORLOOP:
	; Set Cursor Position
	mov edx, 0
	mov dh, 3h
	sub dh, cl
	call Gotoxy

	; generate a color combination
	mov ebx, ecx
	imul ebx, 4
	mov eax, yellow
	add eax, ebx

	; set color
	call SetTextColor ;yellow + (eax)
	
	; write string
	mov edx, OFFSET prompt
	call WriteString

	LOOP COLORLOOP
	exit
main ENDP
end main