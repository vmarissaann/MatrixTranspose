.macro PRINT (%x) 
li a7 1
mv a0, %x
ecall
.end_macro

.macro GETF
li a7, 6
ecall
.end_macro

.macro PRINTF (%x)
mv a0, %x
flw fa0, (a0)
li a7, 2
ecall
.end_macro

.macro GET
li a7, 5
ecall
.end_macro

.macro NEWLINE
li a0, 10
li a7, 11
ecall
.end_macro

.macro PRINT_STRING (%x) 
mv a0, %x
li a7, 4
ecall
.end_macro

.data
str1: .asciz "N: "
str2: .asciz "Reverse:" 
str3: .asciz "Min:"
arr: .word 0

.text
la a1, str1 
PRINT_STRING a1
GET
mv x11 x10
addi x12 x0 0x00000001 
la x13 arr

L1:
GET
sw x10, 0(x13)
addi x12 x12 0x00000001 
addi x13 x13 0x00000008
BGE x11 x12 L1
la x15, str2 
PRINT_STRING x15 
NEWLINE
addi x13 x13 0xFFFFFFF8 
addi x12 x0 0x00000001 

L2:
addi x12 x12 0x00000001 
lw x10, 0(x13)
PRINT x10
NEWLINE
addi x13 x13 0xFFFFFFF8 
BGE x11 x12 L2