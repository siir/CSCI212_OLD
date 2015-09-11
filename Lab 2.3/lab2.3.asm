; Program Name:           lab2.3.asm

; Program Description: Write a program that defines symbolic names for several string literals (characters between quotes). Use each symbolic name in a variable definition.
; Author: Chad Dreier
; Date: 8/31/2015

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
NAME1 TEXTEQU <'John'>
NAME2 TEXTEQU <'Ben'>
NAME3 TEXTEQU <'Abraham'>
NAME4 TEXTEQU <'Chad'>
NAME5 TEXTEQU <'Brett'>
NAME6 TEXTEQU <'Joe'>
NAME7 TEXTEQU <'Roland'>
NAME8 TEXTEQU <'Rod'>
NAME9 TEXTEQU <'Fides'>

; "The IT Team consists of John, Ben, Abraham, Chad, Brett, Joe, Roland, Rod, Fides."
it_team BYTE "The IT Team consists of ", NAME1, ", ", NAME2, ", ", NAME3, ", ", NAME4, ", ", NAME5, ", ", NAME6, ", ", NAME7, ", ", NAME8, " and ", NAME9, ".", 0

.code
main proc

	invoke ExitProcess,0
main endp
end main