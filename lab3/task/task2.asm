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

fib:
    # Input: $a0 = n
    # Output: $v0 = fib(n)

    # Base cases: if n == 0 or n == 1, return n
    ble $a0, 1, fib_base_case
    
    # Save return address and n on stack
    addi $sp, $sp, -12
    sw $ra, 0($sp)
    sw $a0, 4($sp)
    
    # Calculate fib(n-1)
    addi $a0, $a0, -1
    jal fib
    sw $v0, 8($sp)  # Save fib(n-1) on stack
    
    # Calculate fib(n-2)
    lw $a0, 4($sp)  # Restore original n
    addi $a0, $a0, -2
    jal fib
    
    # fib(n) = fib(n-1) + fib(n-2)
    lw $t0, 8($sp)  # Restore fib(n-1)
    add $v0, $t0, $v0
    
    # Restore return address and cleanup stack
    lw $ra, 0($sp)
    addi $sp, $sp, 12
    
    jr $ra

fib_base_case:
    move $v0, $a0
    jr $ra


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