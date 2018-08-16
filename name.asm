section .text
	global _start
_start:
	mov eax,4
	mov ebx,1
	mov ecx,name
	mov edx,9
	int 0x80

	mov [name], dword 'Some'

	mov eax,4
	mov ebx,1
	mov ecx,name
	mov edx,9
	int 0x80

	mov eax,1
	int 0x80

section .data
	name db 'That Name'
