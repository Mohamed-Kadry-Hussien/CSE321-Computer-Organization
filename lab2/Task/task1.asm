.data
msg1:    .asciiz "Enter the first operand : "
msg2:    .asciiz "Enter the second operand : "
msg3:    .asciiz "Enter the third operand : "
msg4:    .asciiz "Enter the fourth operand : "
msg_out: .asciiz "The Out = "
nl:      .asciiz "\n"

.text
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

    li $v0, 4
    la $a0, msg3
    syscall

    li $v0, 5
    syscall
    move $t2, $v0

    li $v0, 4
    la $a0, msg4
    syscall

    li $v0, 5
    syscall
    move $t3, $v0

    addu $t4, $t0, $t1
    addu $t5, $t2, $t3
    addu $t6, $t4, $t5
    li $t7, 4
    div $t6, $t7
    mflo $t8

    li $v0, 4
    la $a0, msg_out
    syscall

    li $v0, 1
    move $a0, $t8
    syscall

    li $v0, 4
    la $a0, nl
    syscall

exit:
    li $v0, 10
    syscall
