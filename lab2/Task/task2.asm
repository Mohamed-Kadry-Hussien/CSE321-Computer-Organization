.data
msg_count:  .asciiz "Enter the number of operands : "
msg_input:  .asciiz "Enter A number :"
dot:        .asciiz "."
msg_result: .asciiz "The Average = "
nl:         .asciiz "\n"

.text
main:
    li $v0, 4
    la $a0, msg_count
    syscall

    li $v0, 5
    syscall
    move $t0, $v0

    li $t1, 0
    li $t2, 0

for:
    li $v0, 4
    la $a0, msg_input
    syscall

    li $v0, 5
    syscall
    move $t3, $v0

    add $t1, $t1, $t3

    addi $t2, $t2, 1
    bne $t2, $t0, for

endfor:
    li $v0, 4
    la $a0, msg_result
    syscall

    div $t1, $t0
    mflo $a0

    li $v0, 1
    syscall

    li $v0, 4
    la $a0, dot
    syscall

    mfhi $a0

    li $v0, 1
    syscall

Exit:
    li $v0, 4
    la $a0, nl
    syscall

    li $v0, 10
    syscall
