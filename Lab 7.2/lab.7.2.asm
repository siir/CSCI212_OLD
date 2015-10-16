; Program Name:           lab.asm

; Program Description: Write a procedure that displays an unsigned 8-bit binary value in 
;						decimal format. Pass the binary value in AL. The input range is 
;						limited to 0 to 99h. The only procedure you can call from the book’s 
;						link library is WriteChar. Here is a sample call:
;
;							mov  al,65h       ; range limit: 0 to 99h 
;							call showDecimal8
;
;						The output from the above would be 65.
;
; Author: Chad Dreier
; Date: 10/1/2015


INCLUDE Irvine32.inc

.data
input BYTE 0E2h ; set the input value here

.code
main PROC 

	movzx eax, input
	call showDecimal

	exit
main ENDP



;---------------------------------------
; showDecimal
;
; Writes decimal value of an unsigned
;   8 bit number
; Receives:
;	AL: 8 bit unsigned value to output
; Returns:
;	nothing
;---------------------------------------
showDecimal PROC
	; save all registers
	PUSHAD
	
	; clear out other registers for 
	;   easier to follow debug
	mov ah, 0
	mov ebx, 0
	mov ecx, 0
	mov edx, 0

	; divisor for converting hex to 
	;   decimal
	mov bl, 10d

DIVLOOP:
	inc ecx									; increment ecx register for later loop to write to console

	div bl									; divide by 10
	
	push eax								; save and blow out remainder
	mov ah, 0
	
	cmp al, 0								; continue to loop until quotient is 0 (10 cannot divide into al completely)
	jne DIVLOOP


WRITELOOP:
	pop eax									; return most recent remainder (remainder is the decimal digit in correct order for output)
	call writeDigit							; call procedure that writes the correct ascii character to console

	LOOP WRITELOOP							; continue to loop until all digits outputted to screen

	; return registers to their state
	POPAD

	ret
showDecimal ENDP


;---------------------------------------
; writeDigit
;
; Writes decimal digit to console
; Receives:
;	AH: 8 bit unsigned value 0 - 9
; Returns:
;	nothing
;---------------------------------------
writeDigit PROC
	push eax

	; check what number is in AH (should be 0 - 9, otherwise do nothing)

CMP0:
	cmp ah, 0
	jne CMP1
	mov al, '0'
	jmp DONE
CMP1:
	cmp ah, 1
	jne CMP2
	mov al, '1'
	jmp DONE
CMP2:
	cmp ah, 2
	jne CMP3
	mov al, '2'
	jmp DONE
CMP3:
	cmp ah, 3
	jne CMP4
	mov al, '3'
	jmp DONE
CMP4:
	cmp ah, 4
	jne CMP5
	mov al, '4'
	jmp DONE
CMP5:
	cmp ah, 5
	jne CMP6
	mov al, '5'
	jmp DONE
CMP6:
	cmp ah, 6
	jne CMP7
	mov al, '6'
	jmp DONE
CMP7:
	cmp ah, 7
	jne CMP8
	mov al, '8'
	jmp DONE
CMP8:
	cmp ah, 8
	jne CMP9
	mov al, '9'
	jmp DONE
CMP9:
	cmp ah, 9
	ja BADNUMBER
	mov al, '9'

DONE:
	call WriteChar

BADNUMBER:
	pop eax

	ret
writeDigit ENDP

end main