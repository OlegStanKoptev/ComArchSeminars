; Программа для обработки одномерного массива
; Делал Коптев Олег из группы БПИ197
; Вариант: 11
; Задание: вывести все элементы массива, кроме первого положительного

format ELF64
public main

extrn printf
extrn scanf
extrn exit

;==============================================================================
section '.code' writable
main:
        call VectorInput
        call Translate
        call VectorOut1
        call VectorOut2
        xor rax, rax
        ret

;------------------------------------------------------------------------------
VectorInput:
        mov rdi, strVecSize
        xor rax, rax
        call printf

        sub  rsp, 16
        lea rdi, [strScanInt]
        mov rsi, vec_size
        xor rax, rax

        call scanf
        add rsp, 16

        mov rax, [vec_size]
        cmp rax, 1
        jg  firstComparison
        
fail:
        mov rdi, strIncorSize
        xor rax, rax
        call printf

        mov  rdi,0
        xor rax, rax
        call exit

firstComparison:
        cmp rax, 100
        jle getVector
        jmp fail

getVector:
        mov rdi, strPleaseFill
        xor rax, rax
        call printf

        xor rcx, rcx
        mov rbx, vec
getVecLoop:
        mov [tmp], rbx
        cmp rcx, [vec_size]
        jge endInputVector

        mov [i], rcx
        mov rdi, strVecElemI
        mov rsi, rcx
        xor rax, rax
        call printf

        push rbp
        push rbp
        lea rdi, [strScanLong]
        mov rsi, rbx
        xor rax, rax
        call scanf
        pop rbp
        pop rbp

        mov rcx, [i]
        inc rcx
        mov rbx, [tmp]
        add rbx, 8
        jmp getVecLoop
endInputVector:
        ret

;------------------------------------------------------------------------------
Translate:
        mov rbx, [vec_size]
        mov [vec2_size], rbx

        xor rbx, rbx
        xor rdx, rdx
        mov r12, vec
        mov r13, vec2

translateVecLoop:
        cmp rbx, [vec_size]
        je endTranslateVector

        cmp [flag], 0
        je secondComparison
        jmp continueTranslate

secondComparison:
        mov rcx, [r12]
        cmp rcx, 0
        jns skipNumber
        jmp continueTranslate

skipNumber:
        inc rbx
        add r12, 8
        inc [flag]
        mov rcx, [vec_size]
        dec rcx
        mov [vec2_size], rcx

continueTranslate:
        mov rcx, [r12]
        mov [r13], rcx

        inc rbx
        inc rdx
        add r12, 8
        add r13, 8

        jmp translateVecLoop

endTranslateVector:
        ret

;------------------------------------------------------------------------------
VectorOut1:
        mov rdi, strFirstArr
        xor rax, rax
        call printf

        xor rcx, rcx
        mov rbx, vec
putVecLoop1:
        mov [tmp], rbx
        cmp rcx, [vec_size]
        je endOutputVector1
        mov [i], rcx

        mov rdi, strVecElemOut
        mov rsi, rcx
        mov rdx, [rbx] 
        xor rax, rax
        call printf

        mov rcx, [i]
        inc rcx
        mov rbx, [tmp]
        add rbx, 8
        jmp putVecLoop1
endOutputVector1:
        ret

;------------------------------------------------------------------------------
VectorOut2:
        mov rdi, strSecondArr
        xor rax, rax
        call printf

        xor rcx, rcx
        mov rbx, vec2
putVecLoop2:
        mov [tmp], rbx
        cmp rcx, [vec2_size]
        je endOutputVector2
        mov [i], rcx

        mov rdi, strVecElemOut
        mov rsi, rcx
        mov rdx, [rbx] 
        xor rax, rax
        call printf

        mov rcx, [i]
        inc rcx
        mov rbx, [tmp]
        add rbx, 8
        jmp putVecLoop2
endOutputVector2:
        ret
;==============================================================================
section '.data' writable

        strPleaseFill db 'Set all elements:', 10, 0
        strFirstArr  db 'First Array:', 10, 0
        strSecondArr db 'Second Array:', 10, 0
        strVecSize   db 'size of vector? ', 0
        strIncorSize db 'Incorrect size of vector', 10, 0
        strVecElemI  db '[%d]? ', 0
        strScanInt   db '%d', 0
        strScanLong  db '%ld', 0
        strSumValue  db 'Summa = %d', 10, 0
        strVecElemOut db '[%d] = %d', 10, 0

        vec_size     dq 0
        vec          rd 100
        vec2_size    dq 0
        vec2         rd 100
        tmp          dq ?
        i            dq ?
        flag         dq 0
