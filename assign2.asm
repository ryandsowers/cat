;Code modified/updated by Ryan Sowers
;Submitted: 02/14/2018
;CS3140 Assignment 2
;Assemble: 	nasm -f elf64 -g assign2.asm
;Link:		ld -o assign2 -m elf_x86_64 assign2.o
;Run:		./assign2

bits 64

section .text	;section declaration 

global _start

_start:

loop_top:
	mov rdx, 1		;read size 1 byte
	mov rsi, rsp	;move onto stack (use stack as buffer)
	mov edi, 0		;input from stdin
	mov eax, 0		;read system call number
	syscall			;do system call

	cmp rax, 1		;compare return value to 1
	jne all_done	;if not 1, reading is complete

	mov rdx, 1		;message length (1 byte)
	mov rsi, rsp	;pointer to message
	mov edi, 1		;output to stdout
	mov eax, 1		;write system call number
	syscall			;do system call

	jmp loop_top	;keep reading until no more bytes left (return value 0)

all_done:
	mov eax, 60		;exit system call number
	syscall			;do system call
