; Program Name:           Euclid.asm

INCLUDE lab9.2.inc

; returns GCD in ebx
;---------------------------------------
; Euclid
;
; Find the greater common denominator
;	using Euclid's algorithm with the
;	order of the parameters not being
;	important
; Receives:
;	pValA: First Number
;	pValB: Second Number
; Returns:
;	EBX: Greatest Common Denominator
;---------------------------------------
.code
Euclid PROC,
	pValA: DWORD,
	pValB: DWORD
	
	; set up registers
	mov eax, pValA
	mov ebx, pValB
	mov edx, 0

	; check if EAX is bigger than EBX
	; if not, then swap registers
	cmp eax, ebx
	ja NO_SWAP

SWAP: 
	xchg eax, ebx
	
NO_SWAP:
	; divide larger parameter by smaller parameter
	; if remainder is zero, the quotient is the GCD
	; if not, then call self with quitient and
	;	remainder as parameters
	div ebx

	cmp edx, 0
	je GCD

	mov [pValA], ebx
	mov [pValB], edx

	INVOKE Euclid, pValA, pValB

GCD:
	
	ret
Euclid ENDP
END