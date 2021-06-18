	.file	"main.c"
	.text
	.globl	my_errno
	.bss
	.align 4
	.type	my_errno, @object
	.size	my_errno, 4
my_errno:
	.zero	4
	.globl	greeting
	.section	.rodata
	.align 8
	.type	greeting, @object
	.size	greeting, 13
greeting:
	.string	"hello world\n"
	.text
	.globl	my_write
	.type	my_write, @function
my_write:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	.cfi_offset 3, -24
	movl	%edi, -28(%rbp)
	movq	%rsi, -40(%rbp)
	movq	%rdx, -48(%rbp)
	movl	$1, %eax
	movl	-28(%rbp), %esi
	movq	-40(%rbp), %rcx
	movq	-48(%rbp), %rdx
	movl	%esi, %ebx
#APP
# 11 "main.c" 1
	int $0x80
# 0 "" 2
#NO_APP
	movl	%eax, -12(%rbp)
	cmpl	$0, -12(%rbp)
	jns	.L2
	movl	-12(%rbp), %eax
	negl	%eax
	movl	%eax, my_errno(%rip)
	movl	$-1, %eax
	jmp	.L3
.L2:
	movl	-12(%rbp), %eax
.L3:
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	my_write, .-my_write
	.globl	main
	.type	main, @function
main:
.LFB1:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	$12, %edx
	leaq	greeting(%rip), %rsi
	movl	$1, %edi
	call	my_write
	movl	$0, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 10.2.0-13ubuntu1) 10.2.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
