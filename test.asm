section .text
	global _start

_start:
	mov eax,len
	mov ebx,msg
	mov ecx,1
	mov edx,4
	int 0x80
	
	mov eax,1
	int 0x80

section .data
msg db 'hello world', 0xa
len equ $ - msg
