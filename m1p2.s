.section .text
.global m1p2
.type m1p2, %function

m1p2:
    push {r4, r5, r6, r7, lr}

    mov r4, #1
    mov r5, r0 // Copy N into r5

main_loop:
    mov r6, #0 // Reset counter
    mov r7, r4

bit_count_loop:
    cmp r7, #0 // Check if we reached 0
    beq check_bit_count

    tst r7, #1 // Check if last bit is 1
    addne r6, r6, #1 // increment ones counter, if result of AND is non zero

    lsr r7, r7, #1 // Right shift current value
    b bit_count_loop

check_bit_count:
    cmp r6, #3 // Check if counter of ones reached 3
    bne increment_loop_counter

    ldr r0, =format_string
    mov r1, r4
    bl printf

increment_loop_counter:
    add r4, r4, #1
    cmp r4, r5
    ble main_loop

exit:
    pop {r4, r5, r6, r7, lr}
    bx lr

.section .rodata
format:
    .asciz "%x\n"
