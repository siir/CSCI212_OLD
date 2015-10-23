; Program Name:           lab10.2.asm

; Program Description: Add a variable to the BubbleSort procedure in Section 9.5.1 that is 
;						set to 1 whenever a pair of values is exchanged within the inner 
;						loop. Use this variable to exit the sort before its normal completion 
;						if you discover that no exchanges took place during a complete pass 
;						through the array. (This variable is commonly known as an exchange 
;						flag.)
; Author: Chad Dreier
; Date: 10/22/2015

INCLUDE Irvine32.inc


.data
myArray DWORD 0h, 1h, 2h, 3h, 5h, 6h, 7h, 8h, 4h
arrLen DWORD ?

.code
BubbleSort PROTO,
	pArray:PTR DWORD,		; pointer to array
	Count:DWORD			; array size
main PROC 
	mov arrLen, LENGTHOF myArray
	INVOKE BubbleSort, ADDR myArray, arrLen
	exit
main ENDP

;----------------------------------------------------------
BubbleSort PROC USES eax ecx esi,
	pArray:PTR DWORD,		; pointer to array
	Count:DWORD			; array size
;
; Sort an array of 32-bit signed integers in ascending order
; using the bubble sort algorithm.
; Receives: pointer to array, array size
; Returns: nothing
;-----------------------------------------------------------
	LOCAL xchgFlag:BYTE		; create a local byte

	mov xchgFlag, 0 ; clear XchgFlag
	mov ecx,Count
	dec ecx			; decrement count by 1

L1:	push ecx			; save outer loop count
	mov esi,pArray		; point to first value

L2:	mov eax,[esi]		; get array value
	cmp [esi+4],eax	; compare a pair of values
	jge L3			; if [esi] <= [edi], don't exch
	mov xchgFlag, 1 ; set XchgFlag
	xchg eax,[esi+4]	; exchange the pair
	mov [esi],eax

L3:	add esi,4		; move both pointers forward
	loop L2		; inner loop

	; exit if no exchanges made
	cmp xchgFlag, 0
	je L4

	mov xchgFlag, 0 ; clear XchgFlag

	pop ecx		; retrieve outer loop count
	loop L1		; else repeat outer loop

L4:	ret
BubbleSort ENDP

end main