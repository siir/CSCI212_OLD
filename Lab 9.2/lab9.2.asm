; Program Name:           lab9.2.asm

; Program Description: Write a recursive implementation of Euclid’s algorithm for finding the 
;						greatest common divisor(GCD) of two integers. Descriptions of this 
;						algorithm are available in algebra books and on theWeb. Write a test 
;						program that calls your GCD procedure five times, using the following 
;						pairs of integers: (5,20), (24,18), (11,7), (432,226), (26,13). After 
;						each procedure call, display the GCD.
;						
; Author: Chad Dreier
; Date: 10/15/2015


INCLUDE lab9.2.inc

.data
ValA DWORD ?
ValB DWORD ?

.code
main PROC 

	mov ValA, 5
	mov ValB, 20
	INVOKE Euclid, ValA, ValB
	mov eax, ebx
	call WriteDec
	Call CrLf

	mov ValA, 24
	mov ValB, 18
	INVOKE Euclid, ValA, ValB
	mov eax, ebx
	call WriteDec
	Call CrLf
	
	mov ValA, 11
	mov ValB, 7
	INVOKE Euclid, ValA, ValB
	mov eax, ebx
	call WriteDec
	Call CrLf
	
	mov ValA, 432
	mov ValB, 226
	INVOKE Euclid, ValA, ValB
	mov eax, ebx
	call WriteDec
	Call CrLf
	
	mov ValA, 26
	mov ValB, 13
	INVOKE Euclid, ValA, ValB
	mov eax, ebx
	call WriteDec
	Call CrLf


	exit
main ENDP
end main