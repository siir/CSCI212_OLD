; Program Name:           lab2.2.asm

; Program Description: Write a program that defines symbolic integer constants for all seven days of the week. Create an array variable that uses the symbols as initializers.
; Author: Chad Dreier
; Date: 8/31/2015

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
SUN EQU 1
MON EQU 2
TUE EQU 3
WED EQU 4
THU EQU 5
FRI EQU 6
SAT EQU 7

week DWORD SUN, MON, TUE, WED, THU, FRI, SAT
daycount = ($ - week) / 4

day DWORD 0

.code
main proc

	; put values from first day to last day into eax reg to verify
	
	mov ecx, daycount				; set ecx reg to max # of days
L1:
	mov ebx, day					; set ebx to current day (offset of week start address)
	imul ebx, 4						; multiply by 4 to get to correct offset
	
; cant figure this out !!!!
	;mov eax, week + OFFSET			; move day value into eax
	;no! mov eax, week + (4 * day)	; move day value into eax
	
	inc day							; increment day counter
	loop L1							; loop

	invoke ExitProcess,0
main endp
end main