INCLUDE Irvine32.inc

.data
buffer BYTE 100 DUP(?)
KEY BYTE 'A','B','X','m','v','#','7','A','B','X','m','v','#','7','A','B','X','m','v','#','7','A','B','X','m','v'
bufSize DWORD ?

.code
main PROC
	call Clrscr
	mov edx, OFFSET buffer
	mov ecx, SIZEOF buffer
	call ReadString
	mov bufsize,eax
	mov ecx,bufsize
	mov esi, 0
L1: mov bl, KEY[esi]
	xor buffer[esi], bl
	inc esi 
	loop L1
call WriteString
exit
main ENDP

END main