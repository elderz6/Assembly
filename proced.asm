section .text
	global _start

_start:
	CALL display
	MOV eax,1
	int 0x80	

display:
	MOV ecx,256

next:
	PUSH ecx
	MOV eax,4
	MOV ebx,1
	MOV ecx,achar
	MOV edx,1
	int 80h
	
	MOV eax,4
	MOV ebx,1
	MOV ecx,space
	MOV edx,lineLn
	int 0x80

	POP ecx
	MOV dx,[achar]
	CMP byte[achar],0dh
	INC byte[achar]
	LOOP next
	RET

newline:
	MOV dl,10
	MOV ah,02h
	int 0x80
	MOV dl,13
	int 0x80
	RET


section .data
	achar DB '0'
	space DB ' ',0xA, 0xD
	lineLn EQU $-space
