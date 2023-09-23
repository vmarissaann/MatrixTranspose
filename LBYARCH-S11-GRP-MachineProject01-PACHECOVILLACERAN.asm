.macro NEWLINE
       	li a7, 11
       	li a0, 10
	ecall
.end_macro

.macro GET_FLOAT(%x)
    	li a7, 6
    	ecall
.end_macro

.macro PRINT_FLOAT(%x)
       	li a7, 2
       	ecall
.end_macro

.text
    	GET_FLOAT f0
    	fmv.s fa0, f0
    	PRINT_FLOAT fa0
    	NEWLINE
    	GET_FLOAT f1
    	PRINT_FLOAT f1

#step 1: try to