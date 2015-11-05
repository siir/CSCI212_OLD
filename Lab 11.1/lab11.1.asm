; Program Name:           lab11.1.asm

; Program Description: Create a macro that waits for a keystroke and returns the key that was 
;						pressed. The macro should include parameters for the ASCII code and 
;						keyboard scan code. Hint: Call ReadChar from the book’s link library. 
;						Write a program that tests your macro. For example, the following code 
;						waits for a key; when it returns, the two arguments contain the ASCII 
;						code and scan code:
;							.data
;							ascii BYTE ?
;							scan BYTE ?
;							.code
;							mReadkey ascii, scan
;
; Author: Chad Dreier
; Date: 10/29/2015

INCLUDE Irvine32.inc
INCLUDE Macros.inc

mReadKey MACRO char, scankey
	push eax			; preserve eax register
	call ReadChar		; use Irvine32 proc
	mov char, AL		; get char ascii code
	mov scankey, AH		; get scankey code
	pop eax				; restore eax

ENDM

.data
ascii BYTE ?
scan BYTE ?

.code
main PROC 
; call mReadKey macro
	mReadKey ascii, scan

; test 
	mov eax,0		; clear eax
	mov al,ascii	; see what is in ascii
	mov al, scan	; see what is in scan

	exit
main ENDP
end main