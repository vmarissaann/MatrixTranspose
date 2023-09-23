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
	fmv.s fa0, %x
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

# September 24
# step 1: maybe flw??
# 	try to get float such that it can be stored in a floating point register
# for checking: should be able to print the value from the register ( i.e. from fa0), error rn: NaN for output

# September 24
#step 2: get input for column and row

# September 25
#step 3: to be able to input floating numbers based on column x row ( i.e. 2 rows, 3 columns = 6 number inputs)

# September 29
#step 4: store input variables in array 
# for checking: check register if properly stored

# September 30
#step 5: transpose in memory (research abt this) / output based on array count or wtvr


