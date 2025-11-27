.data
msg_operand:    .asciiz "Enter number for Switch Case : "
nl:             .asciiz "\n"
msg_case1:      .asciiz "case 1 : selected"
msg_case2:      .asciiz "case 2 : selected"
msg_case3:      .asciiz "case 3 : selected"
msg_default:    .asciiz "no selected cases"

.text
main:
    li $v0, 4
    la $a0, msg_operand
    syscall

    li $v0, 5
    syscall
    move $t0, $v0

switch:
case1:
    li $t1, 1
    bne $t0, $t1, case2

    li $v0, 4
    la $a0, msg_case1
    syscall

    j end_switch
case2:
    li $t1, 2
    bne $t0, $t1, case3

    li $v0, 4
    la $a0, msg_case2
    syscall

    j end_switch
case3:
    li $t1, 3
    bne $t0, $t1, default_case

    li $v0, 4
    la $a0, msg_case3
    syscall

    j end_switch
default_case:
    li $v0, 4
    la $a0, msg_default
    syscall

end_switch:
    li $v0, 4
    la $a0, nl
    syscall

exit:
    li $v0, 10
    syscall
