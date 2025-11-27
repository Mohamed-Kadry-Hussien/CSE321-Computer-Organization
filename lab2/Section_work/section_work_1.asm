.data
    prompt_1: .asciiz "Enter the first num : " 
    prompt_2: .asciiz "Enter the second num : "
    result: .asciiz "the result = "
    newline: .asciiz "\n"

.text
main:
    li $v0, 4
    la $a0, prompt_1
    syscall

    li $v0, 5
    syscall
    move $t1, $v0

    li $v0, 4
    la $a0, prompt_2
    syscall

    li $v0, 5
    syscall
    move $t2, $v0

    addu $t0, $t1, $t2

    li $v0, 4
    la $a0, result
    syscall

    li $v0, 1
    move $a0, $t0
    syscall

    li $v0, 4
    la $a0, newline
    syscall

exit:
    li $v0 10
    syscall
      