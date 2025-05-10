INCLUDE Irvine32.inc

.data
    A DWORD ?
    B DWORD ?
    _C DWORD ?
    D DWORD ?
    msg1 BYTE "Enter: ",0
    msg2 BYTE "Largest: ",0
.code

CheckPrime PROC
    enter 0,0

    mov eax, [ebp + 8]
    cmp eax, 2
    jl notprime

    ; i = 2; i*i <= number; i += 1
    mov ecx, 2
isprime:
    mov eax, ecx
    mul eax
    cmp eax, [ebp + 8]
    jg end_isprime

    mov eax, [ebp + 8]
    mov edx, 0
    div ecx
    cmp edx, 0
    je notprime

    inc ecx
    jmp isprime
end_isprime:
    mov eax, 1
    jmp end_check
notprime:
    mov eax, 0
end_check:
    leave
    ret 8
CheckPrime ENDP

LargestPrime PROC
    enter 0,0

    mov eax, [ebp + 8]
    cmp eax, [ebp + 12]
    jge checkC
    mov eax, [ebp + 12]
checkC:
    cmp eax, [ebp + 16]
    jge checkC
    mov eax, [ebp + 16]
checkD:
    cmp eax, [ebp + 20]
    jge endcheck
    mov eax, [ebp + 20]
endcheck:

    leave
    ret 20
LargestPrime ENDP

main PROC
    mov edx, OFFSET msg1
    call WriteString
    call ReadInt
    mov A, eax
    call WriteString
    call ReadInt
    mov B, eax
    call WriteString
    call ReadInt
    mov _C, eax
    call WriteString
    call ReadInt
    mov D, eax

    push D
    call CheckPrime
    cmp eax, 0
    je endall
    push _C
    call CheckPrime
    cmp eax, 0
    je endall
    push B
    call CheckPrime
    cmp eax, 0
    je endall
    push D
    call CheckPrime
    cmp eax, 0
    je endall

    push D
    push _C
    push B
    push A
    call LargestPrime
    mov edx, OFFSET msg2
    call WriteString
    call WriteDec
endall:
    exit
main ENDP
END main
