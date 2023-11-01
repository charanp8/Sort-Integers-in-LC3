;R1 outer loop
;R2 burner
;R3 inner loop
;R4 burner
;R5 tester

.ORIG x3000
LDI R2, DATA1; Load the base address of the array R2=x3300
LDI R3, DATA2; Load the number of elements
ADD R1, R3 #0
; Outer Loop:
outerloop ADD R4, R2, #0; Set R4 to the first element of the array R2=R4

LDI R3, DATA2; Load the number of elements

; Inner Loop:
innerloop LDR R6, R4, #0; Load the first element into R6 R6=M[R4+0]
LDR R7, R4, #1; Load the second element into R7 R7=M[R4+1]

; Compare R6 and R7 to see if a swap is needed    
NOT R5, R7; Negate the first element
ADD R5, R5, #1
ADD R5, R5, R6; Add the second element to the negated first element

BRzp noswap; If R6 is negative, the second element is greater

STR R7, R4, #0 ; M[R4+0]=R7
STR R6, R4, #1 ; M[R4+1]=R6

noswap ADD R4, R4, #1; Move to the next element in the array
ADD R3, R3, #-1; Decrement the loop counter
BRp innerloop; If the loop counter is positive, continue the inner loop

ADD R2, R2, #0; Move to the next element for the outer loop
ADD R1, R1, #-1; Decrement the loop counter
BRp outerloop; If the loop counter is positive, continue the outer loop

HALT
DATA1 .FILL x3200
DATA2 .FILL x3201
.END