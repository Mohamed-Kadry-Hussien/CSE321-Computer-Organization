.data
msg1:    .asciiz "Enter first number: "
msg2:    .asciiz "Enter second number: "
msg_out: .asciiz "The sum is: "
nl:      .asciiz "\n"

.text
add_func:
    addi $sp, $sp, -4
    sw   $ra, 0($sp)

    add $v0, $a0, $a1

    lw   $ra, 0($sp)
    addi $sp, $sp, 4
    jr $ra

main:
    li $v0, 4
    la $a0, msg1
    syscall

    li $v0, 5
    syscall
    move $t0, $v0

    li $v0, 4
    la $a0, msg2
    syscall

    li $v0, 5
    syscall
    move $t1, $v0

    move $a0, $t0
    move $a1, $t1

    jal add_func

    move $t2, $v0

    li $v0, 4
    la $a0, msg_out
    syscall

    li $v0, 1
    move $a0, $t2
    syscall

    li $v0, 4
    la $a0, nl
    syscall

    li $v0, 10
    syscall
