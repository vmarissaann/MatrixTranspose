.macro NEWLINE
       	li a7, 11
       	li a0, 10
	ecall
.end_macro

.macro GET_FLOAT(%x)
    	li a7, 6
    	ecall
.end_macro

.macro GET_INT(%x)
       	li a7, 5
	ecall
.end_macro

.macro PRINT_FLOAT(%x)
	fmv.s fa0, %x
	li a7, 2
	ecall
.end_macro

.macro PRINT_DEC(%x)
       	li a7, 1
	mv a0, %x
	ecall
.end_macro

.macro PRINT_STRING(%x)
	li a7, 4 
	la a0, %x
	ecall
.end_macro

.data
	input_row: .asciz "Row: "
	input_col: .asciz "Column: "
	space: .asciz " "
	arr: .word 0
	
.text
	li s1, 0
	li s2, 0
	li s3, 0
	li s4, -8
	li s5, 8
	
	PRINT_STRING input_row
	GET_INT a0
	mv a1, a0
	
	PRINT_STRING input_col
	GET_INT a0
	mv a2, a0
	
	mul a3, a1, a2
	la t4, arr
	
	get_input:
	GET_FLOAT fa0
	fsw fa0, 0(t4)
	addi t4, t4, 8
	addi s1, s1, 1
	blt s1, a3, get_input
	beq s1, a3, reset
	
	reset:
	li s3, 0 
	la t4, arr
	mul t5, s5, s2
	add t4, t4, t5
	
	J get_col
	
	get_col:
	flw fa0, 0(t4)
	PRINT_FLOAT fa0
	PRINT_STRING space
	mul t6, a2, s5	
	add t4, t4, t6
	addi s3, s3, 1
	blt s3, a1, get_col
	beq s3, a1, get_row
	
	get_row:
	NEWLINE
	addi s2, s2, 1
	beq s2, a2, end
	blt s2, a2, reset
	
	end:
	li a7, 10
	ecall
