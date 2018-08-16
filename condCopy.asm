section .text
	global _start

_start:
	MOV ecx, [num1]
	CMP ecx, [num2]
	JG check_third_num
	MOV ecx,[num2]
	
check_third_num:
	CMP ecx, [num3]
	JG _exit
	MOV ecx, [num3]

_exit:
	MOV [largest],ecx
	MOV ecx,msg
	MOV edx,len
	MOV ebx,1
	MOV eax,4
	int 0x80

	MOV ecx,largest
	MOV edx,2
	MOV ebx,1
	MOV eax,4
	int 0x80

	MOV eax,1
	int 0x80


section .data
	
	msg DB 'The largest bit is ', 0xA, 0XD
	len EQU $-msg
	num1 DD '47'
	num2 DD '22'
	num3 DD '31'

segment .bss
	largest RESB 2
