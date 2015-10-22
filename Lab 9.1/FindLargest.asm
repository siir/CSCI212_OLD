INCLUDE lab9.1.inc

;---------------------------------------
; FindLargest
;
; Compares values of an array and returns
;	the largest value
; Receives:
;	pArray: Address pointer to start of 
;			array in memory
;	arraySize: length of array
; Returns:
;	EAX: Largest array index value
;---------------------------------------

.code
FindLargest PROC,
	pArray: PTR DWORD,
	arraySize: DWORD
	
	;PUSHAD
	
	mov esi, pArray
	mov ecx, arraySize
	mov eax, [esi]
	dec ecx
ARRAY_SCAN:
	add esi, 4
	mov ebx, [esi]

	cmp ebx, eax
	JLE NOT_GREATER_THAN

	mov eax, ebx

NOT_GREATER_THAN:
	loop ARRAY_SCAN

	;mov largest, eax
	;POPAD
	;mov eax, largest

	ret
FindLargest ENDP
END