# startup.s

.section .text.startup

.global _start
_start:
    # Set the stack pointer to the address of __stack_pointer
    la sp, __stack_pointer

    # Perform any other initialization tasks if needed
    # ...

    # Call main function directly without the standard prologue
    call main

    # If main() returns, handle system shutdown or infinite loop
    # For example, an infinite loop:
    j .
