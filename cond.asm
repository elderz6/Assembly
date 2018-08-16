section .data 
	text1 DB 'Condition success'
	txLen EQU $-text1

section .bss
	num RESB 5

section .text

	global _start

_start:

	MOV eax,4
	MOV ebx,1
	MOV ecx,0
	MOV [num],ecx
	
	CMP ecx,num
	JE l7
	

l7:
	MOV eax,4
	MOV ebx,1
	MOV ecx,text1
	MOV edx,txLen
	int 0x80

	MOV eax,1
	int 0x80
