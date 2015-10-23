; Program Name:           lab10.1.asm

; Program Description: The Str_copy procedure shown in this chapter does not limit the number
;						of characters to be copied. Create a new version (named Str_copyN) that
;						receives an additional input parameter indicating the maximum number of 
;						characters to be copied.
; Author: Chad Dreier
; Date: 


INCLUDE Irvine32.inc

.data
str1 BYTE 'This is the first string',0
str2 BYTE ?

.code
Str_CopyN PROTO,
	source:PTR BYTE,	; source string
	target:PTR BYTE,	; target string
	l:DWORD				; how many chars to copy

main PROC 
	INVOKE Str_CopyN,
		ADDR str1,
		ADDR str2,
		6
	exit
main ENDP

;------------------------------------------------------
Str_CopyN PROC USES eax ecx esi edi,
	source:PTR BYTE,	; source string
	target:PTR BYTE,	; target string
	l:DWORD				; how many chars to copy
;
; Copies a string from source to target up to N Chars.
; Requires: the target string must contain enough
;			space to hold a copy of the source string.
;------------------------------------------------------
	
	mov		ecx,l					; REP count
	mov		esi, source
	mov		edi, target
	cld								; direction = forward
	rep		movsb					; copy the string
	mov		BYTE PTR [edi], 0		; add null byte

	ret
Str_copyN ENDP

end main