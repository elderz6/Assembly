section .text
	global _start

_start:
	MOV eax,3
	MOV ebx,0
	MOV ecx,x

top:	ADD ebx,[ecx]

	ADD ecx,1
	DEC eax
	JNZ top
	
done:
	ADD ebx,'0'
	MOV [sum], ebx

display:
	MOV edx,1
	MOV ecx,sum
	MOV ebx,1
	MOV eax,4
	int 0x80

	MOV eax,1
	int 0x80

section .data	
global x

x:
	 DB 2
	 DB 4
	 DB 3
	
sum :
	 DB 0
