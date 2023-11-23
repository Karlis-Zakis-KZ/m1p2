.global m1p2
.type m1p2, %function

m1p2:
    push {lr}                    @ Save the link register to the stack
    mov r1, #1                   @ Initialize counter to 1

loop:
    cmp r1, r0                   @ Compare counter with N
    bgt end                      @ If counter > N, end the loop

    mov r2, r1                   @ Copy counter to a temporary register
    mov r3, #0                   @ Initialize bit counter to 0

bit_loop:
    and r4, r2, #1               @ Check the least significant bit
    add r3, r3, r4               @ Add it to the bit counter
    lsr r2, r2, #1               @ Right shift the number
    cmp r2, #0                   @ Compare with 0
    bne bit_loop                 @ If not zero, continue the bit loop

    cmp r3, #3                   @ Compare bit counter with 3
    bne next                     @ If not equal, skip the printf

    ldr r0, =format              @ Load the format string
    bl printf                    @ Call printf

next:
    add r1, r1, #1               @ Increment the counter
    b loop                       @ Repeat the loop

end:
    pop {lr}                     @ Restore the link register from the stack
    bx lr                        @ Return from the function

.section .rodata
format:
    .asciz "%x\n"
