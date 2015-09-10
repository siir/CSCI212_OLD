; Program Name:           lab3.2.asm

; Program Description: Write a program that uses a loop to calculate the first seven values 
;						of the Fibonacci number sequence, described by the following formula: 
;						Fib(1) = 1, Fib(2) = 1, Fib(n) = Fib(n – 1) + Fib(n – 2). 
;						Store the seven numbers in a BYTE array called fibonacci.
; Author: Chad Dreier
; Date: 9/3/2015

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
COUNT = 6
fibonacci BYTE COUNT DUP(0)

.code
main proc

	mov eax, 0h						; clear eax
	mov ebx, 0h						; clear ebx

	mov al, 1h						; begin with 1h in al register (last loop value)
	
	mov ecx, COUNT					; set ecx counter register for loop
	
	mov esi,OFFSET fibonacci		; set esi to address of fibonacci variable
L1:
	; bh - 2 times ago
	; ah - 1 times ago
	; al - this time

	mov [esi+ecx], al				; put value of al into memory at correct address

	mov bh, ah						; move last loop's previous loop result value into bh register - now previous 2 loop's value
	mov ah, al						; move the last loop's result value into ah register - now previous loop's value
					
	add al, bh						; add last two results together to get current loop's result value

	LOOP L1
	
	mov [esi+ecx], al				; put value of final loop into memory at correct address
	mov edx, DWORD PTR fibonacci	; double check by copying from memory to a register

	invoke ExitProcess,0
main endp
end main