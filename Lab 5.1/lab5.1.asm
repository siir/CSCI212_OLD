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
LoopCount BYTE 4h
y BYTE 0h
x BYTE 0h
prompt BYTE "STRING ",0

.code
; moves the cursor down one line
nextLine PROC
	; Sets cursor position
	mov dh, y												; set the Y coordinates
	mov dl, x												; set the X coordinates
	Call Gotoxy												; move the cursor
	inc y													; increment the row

	ret
nextLine ENDP

; generate a color combination
genColor PROC
	mov ebx, ecx											; Use ECX to have a different background color
	imul ebx, 16											; multiply by 16 to get complete color byte
	mov eax, yellow											; move yellow constant into EAX register for use by Set Text Color function	
	add eax, ebx											; Add background color to it
	call SetTextColor										; set color

	ret
genColor ENDP

main PROC 
	movzx ecx, LoopCount									; set ECX register for number of loop iterations
	
	call nextLine											; Set Cursor Position
	call genColor											; generate a color combination
COLORLOOP:
	; write string
	mov edx, OFFSET prompt									; move EDX register to position of the prompt in memory
	call WriteString										; call write string function to output string to console
	
	call nextLine											; Set Cursor Position
	call genColor											; generate a color combination

	LOOP COLORLOOP											; Loop
	
	call genColor											; generate a color combination
	Call WaitMsg											; use WaitMsg function to allow user to view console before exiting

	exit
main ENDP
end main