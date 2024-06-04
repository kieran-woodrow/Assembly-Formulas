segment .bss

segment .data
    align 16

    newArray dq 0
    oldArray dq 0
    width dq 0


segment .text
        global resize_image
        extern malloc

resize_image:


    push rbp
    mov rbp, rsp
    sub rsp, 64

    jmp resizeFunction
    here:

    leave
    ret
    

resizeFunction:

    mov r15, rdi                                   ;Will always hold old array address
    mov [oldArray], rdi                            ;Holds oldArray address
    mov r12, rcx                                   ;Will always hold int size of 50
    mov r11, rsi                                   ;Will always hold int width
    mov [width], r11                               ;Holds width value of 400
    mov r13, 3                                     ;R13 is always going to hold a const of 3

   cvtsi2sd xmm0, rcx                              ;Holds double(size)
   cvtsi2sd xmm1, rsi                              ;Holds double(width)
   cvtsi2sd xmm2, rdx                              ;Holds double(height)

   divsd xmm1, xmm0                                ;Holds w_bar
   divsd xmm2, xmm0                                ;Holds h_bar

   mov rax, rcx                                    ;Store int(size) from rcx in rax
   mov rdx, rcx                                    ;Mov size into rdx (is there already)
   mul rdx                                         ;Multiply rax by what's in rcx 
                                                   ;Rax now holds (int)Size*Size 

   mov rax, rax                                    ;Mov rax value back into rax (holds int 2500)
   mov r13, r13                                    ;Mov r13 value into r13 (holds int 3)
   mul r13                                         ;Multiply rax by r13, holds 7500

   mov rbx, rax                                    ;Holds 7500, used so we can free up rax
   mov rdi, rbx                                    ;Mov rbx into rdi to allocate space
   call malloc                                     ;Create mallocArray and store in rax
   mov r11, [width]
   mov [newArray], eax                             ;mov rax into newArray variable array 

   mov rcx, 0                                      ;OuterForloop counter (set to 0)   
   mov r14, 0                                      ;InnerForloop counter (set to 0)   

   outerForLoopStart:
        cmp rcx, r12                               ;Compare counter with size             
        jge outerForLoopEnd

        innerForLoopStart:
            cmp r14, r12                           ;Compare innerForloop counter to size  
            jge outerForLoopEnd

            cvtsi2sd xmm3, rcx                     ;Convert outer counter to double and store in xmm3
            cvtsi2sd xmm4, r14                     ;Convert inner counter to double and store in xmm4

            movsd xmm8, xmm1
            movsd xmm9, xmm2
            mulsd xmm8, xmm4                       ;Multiply w_bar by innerloop counter to make TC
            mulsd xmm9, xmm3                       ;Multiply h_bar by outerloop counter to make TR

            cvttsd2si r9, xmm8                      ;Convert back to int. r9 now holds w_bar * r14 (int TC)
            cvttsd2si r10, xmm9                     ;Convert back to int. r10 now holds h_bar * rcx (int TR)

            mov rax, r12                           ;Move r12 (int size) into rax
            mov rcx, rcx                           ;Move rcx value into rcx
            mul rcx                                ;Multiply rax by rcx
            mov r8, rax                            ;Store the result in r8
            add r8, r14                            ;Add innerloopcounter to the result. 

            mov rax, r8                            ;Move r8 back into rax (Holds r*size+c)
            mov r13, r13                           ;Mov r13 back into r13 (Holds int 3)
            mul r13                                ;Multiply rax by r13
            mov r8, rax                            ;Mov result from rax back into r8. (Now holds (r*size+c) *3). Call this Index. (Used for new Array)

            mov rax, r10                           ;Move r10 (int TR value) into rax
            mov r11, r11                           ;Move r11 value (int width) into r11
            mul r11                                ;Multiply rax by r11 (TR * width)
            mov ebx, eax                           ;Move result into rbx
            add rbx, r9                            ;Add TC to r9 (Now holds TR * width + TC ) (Used for Old Array)

            mov rax, rbx                           ;Move rbx into rax (TR * width * TC)
            mov r13, r13                           ;Move r13 into r13 (holds value 3)
            mul r13                                ;Multiply rax by r13. Rax now holds (TR * width * TC)*3
            mov ebx, eax

           ; lea [newArray+1*r8], [rdi+1*rbx]

           
            mov rax, [newArray]
            lea rsi, [r15+rbx]
            lea rdi, [rax+r8]
            movsd

            ;lea [newArray+2*r8], [oldArray+2*rbx]

            mov rax, 0
            mov rax, [newArray]
            mov rsi, 0
            mov rdi, 0
            lea rsi, [r15+rbx+1]
            lea rdi, [rax+r8+1]
            movsd

            ;lea [newArray+3*r8], [oldArray+3*rbx]

            mov rax, 0
            mov rax, [newArray]
            mov rsi, 0
            mov rdi, 0
            lea rsi, [r15+rbx+2]
            lea rdi, [rax+r8+2]
            movsd

     

        innerForLoopEnd:
            inc r14
            jmp innerForLoopStart

    outerForLoopEnd:
        mov r14, 0
        inc rcx
        cmp rcx, r12
        jge end
        jmp outerForLoopStart

    
end:
    mov rax, [newArray]
    jmp here























    