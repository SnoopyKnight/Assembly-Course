INCLUDE Irvine32.inc

.data
	Menu BYTE "1. x AND y", 0dh,0ah
	BYTE "2. x OR y" , 0dh,0ah
	BYTE "3. NOT x" , 0dh,0ah
	BYTE "4. x XOR y", 0dh,0ah
	BYTE "5. Exit program", 0


	InputX BYTE "Input x: ",0
	InputY BYTE "Input y: ",0
	Result   BYTE "answer:   ",0

caseTable BYTE '1'	
	DWORD ANDop
	EntrySize = ($ - caseTable )
	BYTE '2'
	DWORD ORop
	BYTE '3'
	DWORD NOTop
	BYTE '4'
	DWORD XORop
	BYTE '5'
	DWORD Exitop
NumberOfEntries = ($ - caseTable) / EntrySize



.code

ChooseProc PROC 
	mov ebx, OFFSET caseTable
	mov ecx, NumberOfEntries
L1:	cmp al, [ebx]	
	    jne L2
	    call NEAR PTR [ebx + 1]
	    jmp L3

L2:	add ebx, EntrySize
		loop L1
L3:
	ret
ChooseProc ENDP




ANDop PROC
	pushad
	call Crlf
	mov edx, OFFSET InputX
	call WriteString
	call ReadHex
	mov ebx, eax

	mov edx, OFFSET InputY
	call WriteString
	call ReadHex

	and eax, ebx

	mov edx, OFFSET Result
	call WriteString
	call WriteHex
	call Crlf
	popad
	ret
ANDop ENDP



ORop PROC
	pushad
	call Crlf
	mov edx, OFFSET InputX
	call WriteString
	call ReadHex
	mov ebx, eax

	mov edx, OFFSET InputY
	call WriteString
	call ReadHex
	
	or eax, ebx

	mov edx, OFFSET Result
	call WriteString
	call WriteHex
	call Crlf
	popad
	ret
ORop ENDP




NOTop PROC
	pushad
	call Crlf
	mov edx, OFFSET InputX
	call WriteString
	call ReadHex

	not eax

	mov edx, OFFSET Result
	call WriteString
	call WriteHex
	call Crlf
	popad
	ret
NOTop ENDP




XORop PROC
	pushad
	call Crlf
	mov edx, OFFSET InputX
	call WriteString
	call ReadHex
	mov ebx, eax

	mov edx, OFFSET InputY
	call WriteString
	call ReadHex

	xor eax, ebx

	mov edx, OFFSET Result
	call WriteString
	call WriteHex
	call Crlf
	popad
	ret
XORop ENDP



Exitop PROC
	ret
Exitop ENDP




main PROC
	call Clrscr
	mov edx, OFFSET Menu
	call WriteString
	call Crlf

    call ReadChar
	call WriteChar
    call Crlf
	call ChooseProc
	exit
main ENDP

END main