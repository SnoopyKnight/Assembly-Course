INCLUDE Irvine32.inc

.data
myArray DWORD 10,20,30,40
newArray DWORD 0,0,0,0

.code
main PROC
	mov ecx , LENGTHOF myArray-1
	mov esi , 0
	mov eax , myArray[esi+12]
	mov newArray , eax
L1:
	mov ebx , myArray[4*esi]
	mov newArray[4*esi+8] , ebx
    loop L1

call DumpRegs
call writeInt
exit
main ENDP

END main
