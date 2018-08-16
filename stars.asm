section .text ;code section/segment
	global _start

_start:
	mov edx,len
	mov ecx,msg
	mov ebx,1	;stdout
	mov eax,4	;sys_write
	int 0x80	;kernel

	mov edx,9
	mov ecx,star
	mov ebx,1
	mov eax,4
	int 0x80
	
	mov edx,1
	mov ecx,brk
	mov ebx,1
	mov eax,4
	int 0x80

	mov eax,1	;sys_exit
	int 0x80

section .data
msg db 'Display 9 stars',0xa 	; message 1
len equ $ - msg			; length of message
star times 9 db '*'
brk db '',0xa
