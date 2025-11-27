.data
msg: .asciiz "Enter an Integer : "
nl:    .asciiz "\n"

.text
main:

    li $v0, 4
    la $a0, msg
    syscall

    li $v0, 5
    syscall
    move $t1, $v0

for:
    bge $t2, $t1, end_for
    addu $t2, $t2, 1
    addu $t0, $t0, $t2
    j for

end_for:
    li $v0, 1
    move $a0, $t0
    syscall

    li $v0, 4
    la $a0, nl
    syscall

exit:
    li $v0, 10
    syscall
