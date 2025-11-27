.data
A:  .word 4
B:  .word 6

.text

# ===========================
# Function: compute(a, b)
# returns (a + b) * 2
# ===========================
compute:
    # TODO: Callee-save step (allocate stack)
    addi $sp, $sp, -4       # Allocate space on stack
    sw   $s0, 0($sp)        # Save $s0 (callee-saved register)

    add  $s0, $a0, $a1      # s0 = a + b
    sll  $v0, $s0, 1        # v0 = s0 * 2

    # TODO: Callee-restore step
    lw   $s0, 0($sp)        # Restore $s0
    addi $sp, $sp, 4        # Deallocate stack space

    jr   $ra


# ===========================
# main function (caller)
# ===========================
main:
    lw   $t0, A
    lw   $t1, B
    li   $s0, 99

    # TODO: Caller-save step
    addi $sp, $sp, -12      # Allocate space for 3 registers
    sw   $t0, 0($sp)        # Save $t0 (caller-saved)
    sw   $t1, 4($sp)        # Save $t1 (caller-saved)
    sw   $ra, 8($sp)        # Save $ra (return address)

    move $a0, $t0
    move $a1, $t1
    jal  compute

    move $t3, $v0
    
    # TODO: Caller-restore step
    lw   $t0, 0($sp)        # Restore $t0
    lw   $t1, 4($sp)        # Restore $t1
    lw   $ra, 8($sp)        # Restore $ra
    addi $sp, $sp, 12       # Deallocate stack space

    jr $ra