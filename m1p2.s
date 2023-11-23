.section .data
printf_format: .asciz "%x\n"

.section .text
.global m1p2

m1p2:
    push {r4, r5, r6, r7, r11, lr}

    mov r4, #1
    mov r5, r0 // Copy N into r5

.loop:
    mov r7, r4
    mov r6, #0 // Reset counter
.shift_loop:
    cmp r7, #0 // Check if we reached 0
    beq .shifting_done

    tst r7, #1 // Check if last bit is 1
    addne r6, r6, #1 // increment ones counter, if result of AND is non zero

    mov r7, r7, LSR#1 // Right shift current value
    b .shift_loop
.shifting_done:
    cmp r6, #3 // Check if counter of ones reached 3
    bne .skip_print

    ldr r0, adr_printf_format
    mov r1, r4
    bl printf

.skip_print:
    cmp r4, r5
    addlt r4, r4, #1
    bne .loop
exit:
    pop {r4, r5, r6, r7, r11, pc}

adr_printf_format: .word printf_format
