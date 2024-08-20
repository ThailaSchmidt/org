	.data
A:	.word	0
B:	.word	0
C:	.word	0
txt:	.asciz	"Digite um valor:"
txt2:	.asciz	"O resultado eh: "
txt_AM:	.asciz	"A eh maior."
txt_BM:	.asciz	"B eh maior."
txt_CM:	.asciz	"C eh maior."
ntri:	.asciz " Nao eh triangulo!"
tri:	.asciz " Eh triangulo!"

	.text
main:
	li a7, 4 #imprime str
	la a0, txt
	ecall
	li a7, 5 #le int
	ecall
	mv t0, a0
	la s0, A
	sw a0, 0(s0) #guarda na memória
	li a7, 4
	la a0, txt
	ecall
	li a7, 5
	ecall
	mv t1, a0
	la s0, B
	sw a0, 0(s0)
	li a7, 4
	la a0, txt
	ecall
	li a7, 5
	ecall
	mv t2, a0
	la s0, C
	sw a0, 0(s0)
	addi t3, zero, 0 
	#descobrir maior
	bgt t0, t1, A_maior_B
B_maior_A:
	bgt t1, t2, B_maior
C_maior:
	li a7, 4
	la a0, txt_CM
	ecall
	add t3, t0, t1
	ble t3, t2, nao_tri
	li a7, 4
	la a0, tri
	ecall
	j fim
B_maior:
	li a7, 4
	la a0, txt_BM
	ecall
	add t3, t0, t2
	ble t3, t1, nao_tri
	li a7, 4
	la a0, tri
	ecall
	j fim
A_maior_B:
	bgt t0, t2, A_maior
	j C_maior
A_maior:
	li a7, 4
	la a0, txt_AM
	ecall
	add t3, t1, t2
	ble t3, t0, nao_tri
	li a7, 4
	la a0, tri
	ecall
	j fim
nao_tri:
	li a7, 4
	la a0, ntri
	ecall
fim:
	li a7, 10 #encerra prog
	ecall