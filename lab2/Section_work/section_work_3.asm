.data

msg:     .asciiz "Print numbers from 1 to 10:"
nl:      .asciiz "\n"

.text
main:
    li $t0, 1
    li $t1, 10

    li $v0, 4
    la $a0, msg
    syscall

    li $v0, 4
    la $a0, nl
    syscall

while:
    bgt $t0, $t1, endwhile

    li $v0, 1
    move $a0, $t0
    syscall

    li $v0, 4
    la $a0, nl
    syscall

    add $t0, $t0, 1
    j while

endwhile:
    li $v0, 10
    syscall
