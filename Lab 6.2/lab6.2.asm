; Program Name:           lab6.2.asm

; Program Description: Using the College Registration example from Section 6.7.3 as a starting point, do the following:
;						- Recode the logic using CMP and conditional jump instructions (instead of the .IF and.ELSEIF directives).
;						- Perform range checking on the credits value; it cannot be less than 1 or greater than 30. If an invalid 
;							entry is discovered, display an appropriate error message. 
;						- Prompt the user for the grade average and credits values.
;						- Display a message that shows the outcome of the evaluation, such as “The student can register” or “The 
;							student cannot register”.
;
; Author: Chad Dreier
; Date: 10/1/2015


INCLUDE Irvine32.inc

.data
; Upper and Lower Limits of Grade Average and Credits
	LGrdAvg = 1
	UGrdAvg = 400
	LCredit = 1
	UCredit = 30
; Inputs of Grade Average and Credits
	gradeAverage	DWORD 375;?
	credits			DWORD 28;?

; Prompts
	pGrdAvg			BYTE "Input the students grade average (1-400): ",0
	pCredit			BYTE "Input the students total credits (1-30): ",0
	pGrdAvgHigh		BYTE "The grade average is over the upper limit of 400.",0
	pGrdAvgLow		BYTE "The grade average is below the lower limit of 1.",0
	pCreditHigh		BYTE "The credit total is over the upper limit of 30.",0
	pCreditLow		BYTE "The credit total is below the lower limit of 1.",0
	pOkToRegister	BYTE "The student can register.",0
	pNotOkToRegister	BYTE "The student cannot register.",0

; row position tracking
newY BYTE 0

.code
main PROC

	; Get grade average
		mov edx, OFFSET pGrdAvg							; Write prompt for grade average
		call PromptUser
		mov gradeAverage, eax

	; Check if grade average is within limits
		cmp eax, UGrdAvg								; check if gradeAverage is within upper limit
		jg	GRDAVGHIGH
		cmp eax, LGrdAvg								; check if gradeAverage is within lower limit
		jl	GRDAVGLOW

	; Get credit total
		mov edx, OFFSET pCredit							; Write prompt for credit
		call PromptUser
		mov credits, eax
		
	; Check if credits is within limits
		cmp eax, UCredit								; check if credits is within upper limit
		jg CREDITHIGH
		cmp eax, LCredit								; check if credits is within lower limit
		jl CREDITLOW


	; store inputs
		mov eax, gradeAverage							; store grade average in EAX
		mov ebx, credits								; store credits in EBX
	
	
	; check if ok to register
		cmp eax, 350									; if grade average is greater than 350
		ja	OKTOREGISTER

		cmp eax, 250									; else if grade average is greater than 250
		ja	COMPOUNDTEST
		jmp NEXTTEST
COMPOUNDTEST:
		cmp ebx, 16										;	AND credits less than or equal to 16
		jbe OKTOREGISTER
		jmp NOTOKTOREGISTER
NEXTTEST:
		cmp ebx, 12
		jbe OKTOREGISTER
		jmp NOTOKTOREGISTER

	;.IF gradeAverage > 350
	;   mov OkToRegister,TRUE
	;.ELSEIF (gradeAverage > 250) && (credits <= 16)
	;   mov OkToRegister,TRUE
	;.ELSEIF (credits <= 12)
	;   mov OkToRegister,TRUE
	;.ENDIF

GRDAVGHIGH:
	mov edx, OFFSET pGrdAvgHigh							; Write prompt for grade average too high
	call WriteLine
	JMP quit

GRDAVGLOW:
	mov edx, OFFSET pGrdAvgLow							; Write prompt for grade average too low
	call WriteLine
	JMP quit

CREDITHIGH:
	mov edx, OFFSET pCreditHigh							; Write prompt for credit too high
	call WriteLine
	JMP quit

CREDITLOW:
	mov edx, OFFSET pCreditLow							; Write prompt for credit too low
	call WriteLine
	JMP quit

NOTOKTOREGISTER:
	call NextLine
	mov edx, OFFSET pNotOkToRegister					; Write prompt for not ok to register
	call WriteLine
	JMP quit

OKTOREGISTER:
	call NextLine
	mov edx, OFFSET pOkToRegister						; Write prompt for ok to register
	call WriteLine
	JMP QUIT
QUIT:
	call waitMsg
	exit
main ENDP


;---------------------------------------
; PromptUser
;
; Writes prompt to user and waits for
;	integer input. Controls cursor position
;	for cleaner appearance.
; Receives:
;	EDX = Offset of null terminated string
; Returns:
;	EAX = The integer input
;---------------------------------------
PromptUser PROC
	call WriteString
	call NextLine
	call ReadInt									; Read input for credit
	call NextLine

	ret
PromptUser ENDP

;---------------------------------------
; WriteLine
;
; Writes line and Controls cursor position
;	for cleaner appearance.
; Receives:
;	EDX = Offset of null terminated string
; Returns:
;	Nothing to return
;---------------------------------------
WriteLine PROC
	call WriteString
	call NextLine

	ret
WriteLine ENDP


;---------------------------------------
; NextLine
;
; Moves cursor position for cleaner 
;	appearance.
; Receives:
;	Nothing - cursor row is in newY 
;		variable
; Returns:
;	Nothing to return
;---------------------------------------
NextLine PROC
	; Sets cursor position
		inc newY										; increment the row
		mov dh, newY									; set the Y coordinates
		mov dl, 0										; set the X coordinates
		Call Gotoxy										; move the cursor
	
	ret
NextLine ENDP

END main