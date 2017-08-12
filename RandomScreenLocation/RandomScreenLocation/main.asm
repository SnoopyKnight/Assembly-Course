INCLUDE Irvine32.inc

.data
Count = 100

.code
main PROC
	call Clrscr
	mov ecx, Count
L1:
	call Random32
	mov dl, al
	call Random32
	mov dh, ah
	call Gotoxy
	
	call GetMaxXY

	mov ax,'$'
	call WriteChar

	mov eax, 100
	call Delay

	loop L1

	

	exit
main ENDP

END main