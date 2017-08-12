INCLUDE Irvine32.inc

.data
myArray DWORD 0h,2h,5h,9h,10h
count DWORD ?

.code
main PROC
	mov ecx , LENGTHOF myArray -1
	mov edx , 0
	mov esi , 0
	mov count, ecx
L1:
	mov eax , myArray[esi * TYPE myArray]
	mov ebx , myArray[esi* TYPE myArray + TYPE myArray]
	sub ebx , eax
	add edx , ebx
	inc esi;
	loop L1

call DumpRegs

exit
main ENDP

End main