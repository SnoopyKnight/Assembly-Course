INCLUDE Irvine32.inc
.data
array DWORD 100 DUP(?)
j = -35
k = 80
count = 100

.code
ArrayFill PROC
	push ebp
	mov ebp, esp
	pushad
	mov esi, [ebp+12]
	mov ecx, [ebp+8]
	cmp ecx, 0
	jle L2
L1:
	mov ebx, j
	mov eax, k
	sub eax, ebx
	call RandomRange
	add eax, ebx
	mov [esi], eax
	call WriteInt
	mov al, TAB
	call WriteChar
	add esi, TYPE DWORD
	loop L1

L2:
	popad
	pop ebp
	ret 8
	ArrayFill ENDP

main PROC
	push OFFSET array
	push count
	call ArrayFill
	exit
	main ENDP

END main
