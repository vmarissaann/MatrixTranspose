.macro NEWLINE
       	li a7, 11
       	li a0, 10
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

.macro GET_FLOAT(%x)
    	li a7, 6
    	ecall
.end_macro

.macro PRINT_FLOAT(%x)
	fmv.s fa0, %x
	li a7, 2
	ecall
.end_macro

.data
	empty: .float 0.0
	counter: .float 1.0
	input_row: .asciz "Row: "
	input_col: .asciz "Column: "
	input: .asciz "Input: "

.text	
	# for 1
	li t5, 1
    	
    	# for row
    	PRINT_STRING input_row
    	GET_FLOAT fa0
    	fmv.s fa1, fa0 
    	
    	# for column
	PRINT_STRING input_col
    	GET_FLOAT fa0
    	fmv.s fa2, fa0
    	
    	# row counter 
    	la t1, empty
    	flw fa3, (t1)
    	
    	# col counter
    	la t2, empty
    	flw fa4, (t2)
    	
    	# counter
    	la t3, counter
    	flw fa5, (t3)
    	
    	# reset to 0
    	la t4, empty
    	flw fa6, (t4)
    	
    	# fa1 - row (ex.3)
    	# fa2 - col (ex.2)
    	# fa3 - row ctr
    	# fa4 - col ctr
    	# fa5 - increments 1
    	
	# iterate through columns for row num of times
	
	# compare rows
	get_row:  
	feq.s t4, fa1, fa3
	beqz t4, get_col
	beq t4, t5, add_row
	
	get_col:
	PRINT_STRING input
	GET_FLOAT fa0
	fmv.s fa7, fa0
	fadd.s fa3, fa3, fa5 # increment row
	J get_row
	
	add_row: 
	fadd.s fa4, fa4, fa5 # increment column
	fmv.s fa3, fa6 # reset row counter to 0
	feq.s t6, fa2, fa4
	beqz t6, get_row
	beq t6, t5, output
	
	output:
	PRINT_FLOAT fa7 # print last number inputted
	
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