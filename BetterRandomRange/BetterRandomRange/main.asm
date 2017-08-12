INCLUDE Irvine32.inc
count = 50
.data

.code

main PROC
	call Randomize
	mov ecx, count
L1:
	call BetterRandomRange
	mov al,TAB
	call WriteChar
	loop L1
	call Crlf
	exit
main ENDP

BetterRandomRange PROC
	mov ebx, -300
	mov eax, 100
	sub eax, ebx
	call RandomRange 
	add eax,ebx
	call WriteInt
	ret
BetterRandomRange ENDP


END main
