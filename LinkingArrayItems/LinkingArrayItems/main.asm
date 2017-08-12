INCLUDE Irvine32.inc

.data
charArray BYTE 'H','A','C','E','B','D','F','G'
linkArray DWORD 0,4,5,6,2,3,7,0
newArray BYTE 8 DUP(?)
Count = 8
start = 1

.code
main PROC
	mov ecx, Count
	mov edx, 0
	mov esi, start
L1:
	movzx eax, newArray[edx * TYPE newArray]
	movzx ebx, charArray[esi * TYPE charArray]
	mov eax,ebx

	mov esi,linkArray[esi * TYPE linkArray]
	inc edx

	call WriteChar
	;call DumpRegs
	loop L1

exit
main ENDP

END main
