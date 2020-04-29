.text
	
	.globl	main
main:
	# Print string msg1
	li	$v0,4		# print_string syscall code = 4
	la	$a0, msg1	# load the address of msg
	syscall

	# Get input A from user and save
	li	$v0,5		# read_int syscall code = 5
	syscall	
	move	$t0,$v0		# syscall results returned in $v0

	# Print string msg2
	li	$v0,4		# print_string syscall code = 4
	la	$a0, msg2	# load the address of msg2
	syscall

	# Get input B from user and save
	li	$v0,5		# read_int syscall code = 5
	syscall	
	move	$t1,$v0		# syscall results returned in $v0
	
	# Print string msg3
	li	$v0,4		# print_string syscall code = 4
	la	$a0, msg3	# load the address of msg3
	syscall

	# Get input C from user and save
	li	$v0,5		# read_int syscall code = 5
	syscall	
	move	$t2,$v0		# syscall results returned in $v0
	
	# Print string msg4
	li	$v0,4		# print_string syscall code = 4
	la	$a0, msg4	# load the address of msg4
	syscall

	# Get input X from user and save
	li	$v0,5		# read_int syscall code = 5
	syscall	
	move	$t3,$v0		# syscall results returned in $v0
	
	# Math!
	mul $t4,$t3,$t3	#x^2
	mul $t0,$t0,$t4	#a*x^2
	mul $t1,$t1,$t3	#bx
	
	add	$t5, $t0, $t1	# t5 = ax2  + bx
	add 	$t5,$t5,$t2	# t5= t5 + c

	# Print string msg5
	li	$v0, 4
	la	$a0, msg5
	syscall

	# Print sum
	li	$v0,1		# print_int syscall code = 1
	move	$a0, $t5	# int to print must be loaded into $a0
	syscall

	# Print \n
	li	$v0,4		# print_string syscall code = 4
	la	$a0, newline
	syscall
	
	li  $v0, 4  
    la  $a0, again  
    syscall  

    la  $a0, answer
    li  $a1, 3
    li  $v0, 8
    syscall

    lb  $t4, 0($a0)

    beq $t4, 'y', main
    beq $t4, 'Y', main

    li  $v0, 10 
    syscall 

	li	$v0,10		# exit
	syscall

	# Start .data segment (data!)
	.data
msg1:	.asciiz	"Enter a:   "
msg2:	.asciiz	"Enter b:   "
msg3:	.asciiz	"Enter c:   "
msg4:	.asciiz	"Enter x:   "
msg5:	.asciiz	"ax^2 + bx + c  = "
newline:   .asciiz	"\n"
again:    .asciiz "Again (y or n)? "  
answer:    .asciiz " "