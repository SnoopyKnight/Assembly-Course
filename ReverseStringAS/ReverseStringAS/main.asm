INCLUDE Irvine32.inc

.data
source BYTE "This is the source string",0
sourceSize = ($ - source) -1

.code
main PROC
	mov esi , 0
	mov ecx , sourceSize
L1:                                           ;PUSH
	movzx eax , source[esi]
	push eax
	inc esi
	loop L1

	mov esi , 0
	mov ecx , sourceSize

L2:                                         ;POP
	pop eax
	mov source[esi] , al              ;store reserve string
	inc esi
	loop L2

	mov edx , OFFSET source
	call WriteString
	call Crlf
	call DumpRegs

exit
main ENDP

END main