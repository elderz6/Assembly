segment .data
	msg1 db 'enter a number: ', 0xa, 0xd
	len1 equ $-msg1

	msg2 db 'enter another numer: ',0xa,0xd
	len2 equ $-msg2

	msg3 db 'total: ',0xa,0xd
	len3 equ $-msg3

	msg4 db '', 0xa,0xd
	len4 equ $-msg4


segment .bss
	num1 resb 2
	num2 resb 2
	total resb 2

section .text
	global _start

_start:
	mov eax, 4
	mov ebx,1
	mov ecx,msg1
	mov edx,len1
	int 0x80

	mov eax,3
	mov ebx,2
	mov ecx,num1
	mov edx,2
	int 0x80

	mov eax,4
	mov ebx,1
	mov ecx,msg2
	mov edx,len2
	int 0x80

	mov eax,3
	mov ebx,2
	mov edx,num2
	mov edx,2
	int 0x80

	mov eax,4
	mov ebx,1
	mov ecx,msg3
	mov edx,len3
	int 0x80

	mov eax,[num1]
	sub eax, '0'

	mov ebx,[num2]
	sub ebx, '0'

	add eax,ebx
	add eax,'0'

	mov [total],eax

	mov eax,4
	mov ebx,1
	mov ecx,total
	mov edx,1
	int 0x80

	
exit:
	mov eax,1
	mov ebx,0
	int 0x80
	
