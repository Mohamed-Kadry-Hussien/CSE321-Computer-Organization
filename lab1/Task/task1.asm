.data

name:     .asciiz "Name : Mohamed Kadry"
id:       .asciiz "ID : 12345678910"
course:   .asciiz "Course : CSE321 : Computer Organization"

newline:  .asciiz "\n"   

.text
main:

    li $v0,4
    la $a0,name
    syscall

    li $v0,4
    la $a0,newline
    syscall

    li $v0,4
    la $a0,id
    syscall

    li $v0,4
    la $a0,newline
    syscall

    li $v0,4
    la $a0,course
    li $v0,4
    la $a0,course
    syscall

    li $v0,4
    la $a0,newline
    syscall

    li $v0,10
    syscall
