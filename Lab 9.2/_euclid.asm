; Program Name:           Euclid.asm

INCLUDE lab9.2.inc

; returns GCD in ebx

.code
Euclid PROC,
	pValA: DWORD,
	pValB: DWORD
	
	mov eax, pValA
	mov ebx, pValB
	mov edx, 0

	cmp eax, ebx
	ja NO_SWAP

SWAP: 
	xchg eax, ebx
	
NO_SWAP:
	
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