.data                #data_segment

    hello: .asciiz "Hello, World!"

.text                #code_segment

    main:
        li $v0, 4
        la $a0, hello
        syscall

        li $v0, 10
        syscall