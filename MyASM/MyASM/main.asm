TITLE MASM Template						(main.asm) 
; Description:HW 4.10.1
;
; Revision date: 

INCLUDE Irvine32.inc
.data
myBytes BYTE 12h,34h,56h,78h
myArray BYTE 0,0,0,0
.code
main PROC
	mov al,BYTE PTR [myBytes+3]
	mov myArray,al
	mov al,BYTE PTR [myBytes+2]
	mov [myArray+1],al
	mov al,BYTE PTR [myBytes+1]
	mov [myArray+2],al
	mov al,BYTE PTR [myBytes]
	mov [myArray+3],al

	mov ebx,DWORD PTR myArray
	mov DWORD PTR myBytes,ebx
	call DumpRegs
exit
main ENDP

END main
