INCLUDE Irvine32.inc
.data
Array1 DWORD 3,2,3,4,8,7,9,7,6,7,3,3,3
Array2 DWORD 9,8,7,6,5,4,1,2,3,4,7,8,3,6,3,2,3,3,3,7,8,4
Array3 DWORD 3,2,3,4,8,7,9,7,6,7,3,3,3,9,8,7,6,5,4,1,2,3,4,7,8,3,6,3,2,3,3,3,7,8,4

.code
main PROC
	mov esi, OFFSET Array1
	mov ecx, LENGTHOF Array1
	call FindThrees

	mov esi, OFFSET Array2
	mov ecx, LENGTHOF Array2
	call FindThrees

	mov esi, OFFSET Array3
	mov ecx, LENGTHOF Array3
	call FindThrees

exit
main ENDP

FindThrees PROC
	push ebp
	mov ebp,esp
	pushad
	mov esi, [ebp+12]
	mov ecx, [ebp+8]
	cmp ecx, 0
	jle L2
top:
	  mov ebx, [esi]
	  cmp ebx, 3
	  je Yes
	  jmp No
	  add esi ,TYPE WORD
	  loop top

Yes:inc edx
	  cmp edx, 3
	  je L1
	  add esi ,TYPE WORD
	  loop top

No:mov edx ,0
	 add esi ,TYPE WORD
	 loop top

L1:mov eax, 1
	call DumpRegs

L2:popad
	 pop ebp
	 ret 8 

FindThrees ENDP

END main
