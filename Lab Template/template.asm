; 32-bit assembly language template

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.code
main proc




	invoke ExitProcess,0
main endp
end main