; Program Name:           lab6.1.asm

; Program Description: Create a procedure that fills an array of doublewords with N random integers,
;						making sure the values fall within the range j...k, inclusive. When calling 
;						the procedure, pass a pointer to the array that will hold the data, pass N, 
;						and pass the values of j and k. Preserve all register values between calls 
;						to the procedure. Write a test program that calls the procedure twice, using 
;						different values for j and k. Verify your results using a debugger.
; Author: Chad Dreier
; Date: 9/30/2015
;
; Note: From a profesional high level developer... this is cool stuff!


INCLUDE Irvine32.inc

.data
N = 20d
MyArray DWORD N DUP(?)

.code
main PROC 

	Call Randomize								; Call Irvine32 random seed generator
	
	mov esi, OFFSET MyArray						; pointer of MyArray
	mov ecx, N									; length of MyArray
												; only need to set these once - they will be preserved by function fills

	mov ebx, 000f000d3h							; lower bound of fills call 1
	mov edx, 0ddaff23ah							; upper bound of fills call 1
	call fills
	
	mov ebx, 000aa23d3h							; lower bound of fills call 2
	mov edx, 0dfffffffh							; upper bound of fills call 2
	call fills

	exit
main ENDP


;---------------------------------------
; fills
;
; Fills array with random integers that
;	falls within a range of two numbers
; Receives:
;	ESI = The array offset
;	EBX = The lower bound limit
;	EDX = The upper bound limit
;	ECX = The length of the array
; Returns:
;	Nothing. Return value is in memory
;---------------------------------------
fills PROC
	PUSHAD										; save all registers
	
FILL:
	call Random32								; Generate random number
	
	cmp eax,ebx									; compare random number to lower limit
	jb FILL										; redo loop if number is below lower limit

	cmp eax,edx									; compare random number to upper limit
	ja FILL										; redo loop if numer is above upper limit

	mov [esi], eax								; number is between range! store in memory
	add esi, TYPE DWORD							; advance pointer to next integer

	loop FILL									; loop until all of array is filled

	POPAD										; restore all registers
	ret
fills ENDP
END main