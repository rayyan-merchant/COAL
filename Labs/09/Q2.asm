INCLUDE Irvine32.inc

.data
    arr DWORD 1, 2, 3, 4, 5, 6, -1, 8, 9, 10, 22, 12, 13, 14, 15, 16, 17, 18, 19, 20
    msg1 BYTE "Min value: ",0
    msg2 BYTE "Max value: ",0
.code

MinMaxArray PROC
    push ebp
    mov ebp, esp

    mov esi, [ebp + 8]
    mov eax, [esi] ; min value
    mov ebx, [esi] ; max value
    mov ecx, 20
find:
    cmp eax, [esi]
    jl notmin
    mov eax, [esi]
notmin:
    cmp ebx, [esi]
    jg notmax
    mov ebx, [esi]
notmax:
    add esi, [ebp + 12]
    loop find

    pop ebp
    ret 12
MinMaxArray ENDP

main PROC
    push TYPE arr
    push OFFSET arr
    call MinMaxArray

    mov edx, OFFSET msg1
    call WriteString
    call WriteInt
    call CRLF
    mov eax, ebx
    mov edx, OFFSET msg2
    call WriteString
    call WriteInt

    exit
main ENDP
END main
