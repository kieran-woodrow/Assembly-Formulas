segment .bss

segment .data

segment .text
        global color_distance


color_distance:

    push rbp
    mov rbp, rsp       ;Allign stack
    
    mov r8, 0
    mov r8b, dil       ;Holds Blue1
    cvtsi2sd xmm0, r8
    shr rdi, 8         ;Shift right

    mov r8, 0
    mov r8b, dil       ;Holds Green1
    cvtsi2sd xmm1, r8
    shr rdi, 8         ;Shift right

    mov r8, 0
    mov r8b, dil       ;Holds Red1
    cvtsi2sd xmm2, r8

    mov r8, 0
    mov r8b, sil       ;Hold Blue2
    cvtsi2sd xmm3, r8
    shr rsi, 8         ;Shift right

    mov r8, 0
    mov r8b, sil      ;Hold Green2
    cvtsi2sd xmm4, r8
    shr rsi, 8         ;Shift right

    mov r8, 0
    mov r8b, sil      ;Hold Red2
    cvtsi2sd xmm5, r8

    mov r9, 256
    cvtsi2sd xmm7, r9  ;Holds 256

    mov r9, 2
    cvtsi2sd xmm8, r9  ;Holds 2

    mov r9, 255
    cvtsi2sd xmm9, r9  ;Holds 255

    mov r9, 4
    cvtsi2sd xmm10, r9  ;Holds 4

    movsd xmm6, xmm2    ;Mov R1 into xmm6

    addsd xmm6, xmm5    ;Add R=(R1+R2)

    divsd xmm6, xmm8    ;Holds R=(R1+R2)/2

    movsd xmm11, xmm6   ;Holds copy R=(R1+R2)/2

    divsd xmm11, xmm7   ;Holds R/256

    addsd xmm11, xmm8   ;Add 2 + R/256

    subsd xmm2, xmm5    ;Holds R1-R2

    mulsd xmm2, xmm2    ;Holds (R1-R2)^2

    mulsd xmm11, xmm2   ;(Holds 2+R/256)(R1-R2)^2  (A)

    subsd xmm1, xmm4    ;Holds G1-G2

    mulsd xmm1, xmm1    ;Holds (G1-G2)^2

    mulsd xmm1, xmm10   ;Holds (G1-G1)^2*4  (B)

    addsd xmm11, xmm1   ;Holds result of(A+B)

    subsd xmm9, xmm6    ;255-R(copy of R)

    divsd xmm9, xmm7    ;Holds (255-R)/256

    addsd xmm9, xmm8    ;Holds (2+(255-R)/256)

    subsd xmm0, xmm3    ;Holds B1-B2

    mulsd xmm0, xmm0    ;Holds (B1-B2)^2

    mulsd xmm9, xmm0    ;Holds (B1-B2)^2*(2+(255-R)/256)

    addsd xmm11, xmm9   ;Add to running total of all thing added together

    sqrtsd xmm11, xmm11  ;Square root it all

    cvtsd2ss xmm11, xmm11 ;Convert back to float

    movss xmm0, xmm11   ;Move into return register
    
    leave 

    ret






 

































   

  




