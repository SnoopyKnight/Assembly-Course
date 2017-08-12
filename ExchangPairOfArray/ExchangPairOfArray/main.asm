INCLUDE Irvine32.inc
.data
MyArray WORD 100h,200h,300h,400h,500h,600h
count DWORD ?

.code
main PROC
	mov ecx,SIZEOF MyArray
	mov esi,OFFSET MyArray
L1:
	mov count , ecx
	mov eax ,  OFFSET MyArray
	mov ebx , OFFSET MyArray+2
	xchg eax , ebx
	dec ecx
	inc esi
	loop L1

	call DumpRegs
exit
main ENDP

END main
