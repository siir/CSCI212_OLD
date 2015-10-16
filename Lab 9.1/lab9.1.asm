; Program Name:           lab.asm

; Program Description: Create a procedure named FindLargest that receives two parameters: a pointer 
;						to a signed doubleword array, and a count of the array’s length. The procedure 
;						must return the value of the largest array member in EAX. Use the PROC directive 
;						with a parameter list when declaring the procedure. Preserve all registers 
;						(except EAX) that are modified by the procedure. Write a test program that calls 
;						FindLargest and passes three different arrays of different lengths. Be sure to 
;						include negative values in your arrays. Create a PROTO declaration for FindLargest.
;						
; Author: Chad Dreier
; Date: 10/15/2015


INCLUDE lab9.1.inc

.data
myArray1 DWORD 100h, 120h, 110h, 200h, 150h, 201h
myArray1_LEN DWORD ?

.code
main PROC 
	mov eax, 0
	mov ebx, 0
	mov ecx, 0
	mov edx, 0
	
	mov myArray1_LEN, LENGTHOF myArray1
	INVOKE FindLargest, ADDR myArray1, myArray1_LEN



	exit
main ENDP
end main
