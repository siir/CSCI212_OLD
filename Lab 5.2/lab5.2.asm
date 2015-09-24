; Program Name:           lab5.2.asm

; Program Description: Write a program that clears the screen, locates the cursor
;						near the middle of the screen, prompts the user for two 
;						integers, adds the integers, and displays their sum.
; Author: Chad Dreier
; Date: 9/17/2015


INCLUDE Irvine32.inc

.data
; divisor BYTE 2h											; tried to get division to work... not quite understanding

maxX BYTE 120d												; max of my window during development
maxY BYTE 22d												; max of my window during development

newX BYTE 60d												; middle of my window during development
newY BYTE 11d												; middle of my window during development

; prompts / response for console/user interaction
prompt1 BYTE "Enter 32 bit integer 1: ",0
prompt2 BYTE "Enter 32 bit integer 2: ",0
response BYTE "Sum: ",0

; memory storage for integers while registers are in use
int1 DWORD ?
int2 DWORD ?
sum DWORD ?

.code
moveCursor PROC
	; Sets cursor position
	mov dh, newY											; set the Y coordinates
	mov dl, newX											; set the X coordinates
	Call Gotoxy												; move the cursor
	inc newY												; increment the row

	ret
movecursor ENDP
main PROC 
	call Clrscr												; clear the console screen

	Call moveCursor											; Set cursor position
	
	; Write prompt for first integer
	mov edx, OFFSET prompt1									; move position in memory of prompt1 into EDX register
	call WriteString										; call write string function to output memory from position in EDX register
	
	; Read input for first integer
	call ReadInt											; call Read Integer function to put 32bit integer input into EAX register
	mov int1, eax											; copy value from EAX register to memory at int1
	
	Call moveCursor											; Set cursor position
	
	; Write prompt for second integer
	mov edx, OFFSET prompt2									; move position in memory of prompt2 into EDX register
	call WriteString										; call write string function to output memory from position in EDX register
	
	; Read input for second integer
	call ReadInt											; call Read Integer function to put 32bit integer input into EAX register
	mov int2, eax											; copy value from EAX register to memory at int2
	
	Call moveCursor											; Set cursor position

	; Add up the two integers and store in memory
	mov eax, int1											; copy value from memory at int1 to EAX register 
	add eax, int2											; add value from memory at int2 to EAX register 
	mov sum, eax											; copy value from EAX register to memory at sum

	; Write response message
	mov edx, OFFSET response								; move position in memory of response string into EDX register
	call WriteString										; call write string function to output memory from position in EDX register

	; Write response answer
	mov edx, OFFSET sum										; move position in memory of sum into EDX register
	call WriteInt											; call write integer function to output memory from position in EDX register
	
	Call moveCursor											; Set cursor position

	; Allow the user to see console before exiting
	Call WaitMsg
	
	exit
main ENDP
end main