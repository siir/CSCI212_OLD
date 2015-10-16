INCLUDE lab9.1.inc

.code
FindLargest PROC,
	pArray: PTR DWORD,
	arraySize: DWORD ;,LOCAL largest: DWORD
	
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