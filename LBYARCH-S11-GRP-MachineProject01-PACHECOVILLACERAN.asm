.macro NEWLINE
       	li a7, 11
       	li a0, 10
	ecall
.end_macro

.macro GET_INT(%x)
       	li a7, 5
	ecall
.end_macro

.macro GET_FLOAT(%x)
    	li a7, 6
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

.macro PRINT_FLOAT(%x)
	fmv.s fa0, %x
	li a7, 2
	ecall
.end_macro

.data
	input_row: .asciz "Row: "
	input_col: .asciz "Column: "
	input: .asciz "Input: "

.text	
	# initialize
	li t1, 0 # row ctr
	li t2, 0 # col 
	li t3, 0 # reset
    	
    	# for row
    	PRINT_STRING input_row
    	GET_INT a0
    	mv a1, a0 
    	
    	# for column
	PRINT_STRING input_col
    	GET_INT a0
    	mv a2, a0
    	    	    	    	
    	# a1 - row 
    	# a2 - col 
    	# t1 - row ctr
    	# t2 - col ctr
    	# t3 - resets to 0
    	# t4 - increments 1
    	
	# iterate through columns for row num of times
	
	get_row:  
	bne a1, t1, get_col
	beq a1, t1, add_row
	
	get_col:
	PRINT_STRING input
	GET_FLOAT fa0
	fmv.s fa1, fa0
	addi t1, t1, 1
	J get_row
	
	add_row: 
	addi t2, t2, 1
	mv t1, t3 
	bne a2, t2, get_row
	beq a2, t2, output
	
	output:
	PRINT_FLOAT fa1 # print last number inputted
	
# September 24 (DONE)
# step 1: maybe flw??
# 	try to get float such that it can be stored in a floating point register
# for checking: should be able to print the value from the register ( i.e. from fa0), error rn: NaN for output

# September 24 (DONE)
#step 2: get input for column and row

# September 25 (DONE)
#step 3: to be able to input floating numbers based on column x row ( i.e. 2 rows, 3 columns = 6 number inputs)

# September 29
#step 4: store input variables in array 
# for checking: check register if properly stored

# September 30
#step 5: transpose in memory (research abt this) / output based on array count or wtvr
