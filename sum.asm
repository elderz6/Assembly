section .data
	userMsg db 'insert a number: '
	lenUserMsg equ $-userMsg
	dispMsg db 'Typed Number: '
	lenDispMsg equ $-dispMsg

	userMsg2 db 'insert another number: '
	lenUserMsg2 equ $-userMsg2
	dispMsg2 db 'the sum of these numbers is= '
	lenDispMsg2 equ $-dispMsg2
	
	msg3 db '---------'
	len3 equ $-msg3

section .bss
	num resb 5
	num2 resb 5
	total resb 5

section .text		;code starts here
	global _start

_start:
	;display first prompt
	mov eax,4
	mov ebx,1
	mov ecx,userMsg
	mov edx,lenUserMsg
	int 0x80

	;read and store inputs
	mov eax,3
	mov ebx,2
	mov ecx,num
	mov edx,5	;5 bytes
	int 0x80
	
	;output message
	mov eax,4
	mov ebx,1
	mov ecx,dispMsg
	mov edx,lenDispMsg
	int 0x80

	;output the number
	mov eax,4
	mov ebx,1
	mov ecx,num
	mov edx,5
	int 0x80


	;second part
	mov eax,4
	mov ebx,1
	mov ecx,userMsg2
	mov edx,lenUserMsg2
	int 0x80

	mov eax,3
	mov ebx,2
	mov ecx,num2
	mov edx,5
	int 0x80

	mov eax, [num]
	sub eax,'0'
	mov ebx, [num2]
	sub ebx,'0'
	add eax,ebx
	add eax,'0'
	mov [total],eax

	mov eax,4
	mov ebx,1
	mov ecx,dispMsg2
	mov edx,lenDispMsg2
	int 0x80

	mov eax,4
	mov ebx,1
	mov ecx,total
	mov edx,1
	int 0x80

	mov eax,4
	mov ebx,1
	mov ecx,msg3
	mov edx,len3
	int 0x80
	
	;exit
	mov eax,1
	mov ebx,0
	int 0x80
