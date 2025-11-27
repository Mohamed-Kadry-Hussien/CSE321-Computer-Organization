.data

failMsg:    .asciiz "Test case failed!!\n\n"
passMsg:    .asciiz "Test case passed!!\n\n"

excpected:  .asciiz "\tExcepected =\t"
result:     .asciiz "\tResult =\t\t"

newLine:    .asciiz "\n"

test1:   .asciiz "Test fib(0)\n"
test2:   .asciiz "Test fib(1)\n"
test3:   .asciiz "Test fib(2)\n"
test4:   .asciiz "Test fib(3)\n"
test5:   .asciiz "Test fib(4)\n"
test6:   .asciiz "Test fib(5)\n"
test7:   .asciiz "Test fib(6)\n"

.text
#=================================================================================================#
fib:
    # Input: $a0 = n
    # Output: $v0 = fib(n)

    # if n == 0 or n == 1, return n directly
    li $t0, 1
    ble $a0, $t0, fib_base_case

    li $t1, 0      # fib(0)
    li $t2, 1      # fib(1)
    li $t3, 2      # counter 

fib_loop:
    beq $t3, $a0, fib_done_loop  # if counter == n, stop loop
    add $t4, $t1, $t2            # fib(n) = fib(n-1) + fib(n-2)
    move $t1, $t2                # fib(n-2) = fib(n-1)
    move $t2, $t4                # fib(n-1) = fib(n)
    addi $t3, $t3, 1             # counter++
    j fib_loop

fib_done_loop:
    add $v0, $t1, $t2            # fib(n) = fib(n-1) + fib(n-2)
    jr $ra

fib_base_case:
    move $v0, $a0
    jr $ra


#=================================================================================================#

main:
    addi $sp, $sp, -4
    sw   $ra, 0($sp)

    # ========= test fib(0) =========
    li $a0, 0
    jal fib
    li $a0, 0
    move $a1, $v0
    la $a2, test1
    jal assertNotEqual

    # ========= test fib(1) =========
    li $a0, 1
    jal fib
    li $a0, 1
    move $a1, $v0
    la $a2, test2
    jal assertNotEqual

    # ========= test fib(2) =========
    li $a0, 2
    jal fib
    li $a0, 1
    move $a1, $v0
    la $a2, test3
    jal assertNotEqual

    # ========= test fib(3) =========
    li $a0, 3
    jal fib
    li $a0, 2
    move $a1, $v0
    la $a2, test4
    jal assertNotEqual

    # ========= test fib(4) =========
    li $a0, 4
    jal fib
    li $a0, 3
    move $a1, $v0
    la $a2, test5
    jal assertNotEqual

    # ========= test fib(5) =========
    li $a0, 5
    jal fib
    li $a0, 5
    move $a1, $v0
    la $a2, test6
    jal assertNotEqual

    # ========= test fib(6) =========
    li $a0, 6
    jal fib
    li $a0, 8
    move $a1, $v0
    la $a2, test7
    jal assertNotEqual

    lw   $ra, 0($sp)
    addi $sp, $sp, 4
    jr $ra


assertNotEqual:

    move $t0, $a0
    
    li $v0, 4
    move $a0, $a2
    syscall

    la $a0, excpected
    syscall

    li $v0, 1
    move $a0, $t0
    syscall

    li $v0, 4
    la $a0, newLine
    syscall

    la $a0, result
    syscall

    li $v0, 1
    move $a0, $a1
    syscall

    li $v0, 4
    la $a0, newLine
    syscall

    bne $t0, $a1, printFail

    la $a0, passMsg
    syscall

    j return

printFail:
    la $a0, failMsg
    syscall

return:
    jr $ra
