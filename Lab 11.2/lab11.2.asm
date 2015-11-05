; Program Name:           lab11.2.asm

; Program Description: Create a macro named mReadInt that reads a 16- or 32-bit signed integer 
;						from standard input and returns the value in an argument. Use conditional 
;						operators to allow the macro to adapt to the size of the desired result. 
;						Write a program that tests the macro, passing it operands of various sizes.
;
; Author: Chad Dreier
; Date: 10/29/2015

INCLUDE Irvine32.inc
INCLUDE Macros.inc

Integer UNION
	D DWORD 0
	W WORD 0
	B BYTE 0
Integer ENDS

mReadInt MACRO o
	push eax				; preserve eax
	push ebx				; preserve ebx

	Call ReadInt			; call Irvine32 function
	
	movzx ebx, al			; zero extend al into ebx
	IFIDNI <ebx>,<eax>		; see if eax and ebx equal
		mov o.b, al			; if they are then put in Integer union BYTE
;	ELSE
;		movzx ebx, ax		; zero extend ax into ebx
;		IFIDNI <ax>,<eax>	; see if eax and ebx equal
;			mov o.w, ax		; if they are then put in Integer union WORD
;		ELSE
;			mov o.d, eax	; else put in Integer union DWORD
;		ENDIF
	ENDIF
;mov o.b, al
	pop eax
ENDM

.data
output Integer <>
val DWORD ?

.code
main PROC 
; call mReadInt macro
	mReadInt output		; check memory

; call mReadInt macro
	mReadInt output		; check memory
	
; call mReadInt macro
	mReadInt output		; check memory

	exit
main ENDP
end main