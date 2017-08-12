INCLUDE Irvine32.inc
.data
array SDWORD +24,+37,-8,+12,-30,-17,+23,-1,-33,+5
j=-20
k=30

.code
ArraySum PROC
	pushad
	mov esi, OFFSET array
	mov ecx, LENGTHOF array
	mov eax, 0
L1:
    cmp SDWORD PTR [esi], j
	jl next
	cmp SDWORD PTR [esi], k
	jg next
	add eax,SDWORD PTR [esi]
next:
    add esi,TYPE array
	loop L1

	call WriteInt
	popad
	ret
ArraySum ENDP

main PROC
    call Clrscr
    call ArraySum
	exit
main ENDP

END main