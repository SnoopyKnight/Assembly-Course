INCLUDE Irvine32.inc
.data
num DWORD 6

.code
main PROC
	mov ecx , num
	mov eax , 1                 ;initialize
	mov ebx , 0

L1:
	add eax,ebx               ;Fibo form
	call DumpRegs
	xchg eax,ebx            
	loop L1

exit
main ENDP

END main
