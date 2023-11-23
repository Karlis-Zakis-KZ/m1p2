.section .data
format_string: .asciz "%x\n"  // Define a format string for printf

.section .text
.global m1p2  // Declare the m1p2 function as global

m1p2:
    push {r4-r7, lr}  // Save registers r4-r7 and the link register

    mov r4, #1  // Initialize loop counter
    mov r5, r0  // Store the input argument in r5

main_loop:
    mov r6, #0  // Initialize bit count
    mov r7, r4  // Copy the loop counter

bit_count_loop:
    cmp r7, #0  // Check if we've finished counting bits
    beq check_bit_count  // If so, jump to check_bit_count

    tst r7, #1  // Test the least significant bit
    addne r6, r6, #1  // If it's 1, increment the bit count

    lsr r7, r7, #1  // Shift right by 1 bit
    b bit_count_loop  // Repeat the loop

check_bit_count:
    cmp r6, #3  // Check if the bit count is 3
    bne increment_loop_counter  // If not, jump to increment_loop_counter

    ldr r0, =format_string  // Load the address of the format string
    mov r1, r4  // Move the current number to r1
    bl printf  // Call printf

increment_loop_counter:
    add r4, r4, #1  // Increment the loop counter
    cmp r4, r5  // Compare the loop counter with the input argument
    ble main_loop  // If less or equal, repeat the main loop

exit:
    pop {r4-r7, lr}  // Restore the saved registers
    bx lr  // Return from the function
