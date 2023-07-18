
.section .text

.global _start

# fibonacci.s
# ---------------------------------------------------
#   This lib is for the multiplication of two 32 bit
# integer values.
#                   
#   a0 <- Number of loops
#   results -> a0


_start:
    li a0, 10
    jal fibonacci
    la t0, RESULTS
    sw a0, 0(t0)
    jal inf_loop

fibonacci:
    mv t0, a0                   # t0 = i
    addi a0, zero, 0
    addi a1, zero, 1
    bge zero, t0, end           # if i <= 0 jump

logic:
    add t1, a0, a1              # Sum 
    mv a0, a1                   # Current 
    mv a1, t1                   # Next = to the Sum
    addi t0, t0, -1             # i--
    blt zero, t0, logic         # while i > 0
end:
    ret

inf_loop:
    jal inf_loop

.data
RESULTS: .word 0x000000FC