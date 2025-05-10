INCLUDE Irvine32.inc

.data
    arr DWORD 10, 9, 8, 7, 6, 5, 4, 3, 2, 1
.code

BubbleSort PROC
    enter 0,0

    mov ecx, [ebp + 12]
    dec ecx
outer:
    push ecx
    mov esi, [ebp + 8]
    mov edi, esi
    add edi, 4
    mov ecx, [ebp + 12]
    dec ecx
inner:
    mov eax, [esi]
    cmp eax, [edi]
    jle skip
    xchg eax, [edi]
    mov [esi], eax
skip:
    add esi, 4
    add edi, 4
    loop inner
    pop ecx
    loop outer

    leave
    ret 12
BubbleSort ENDP

main PROC
    push LENGTHOF arr
    push OFFSET arr
    call BubbleSort

    mov ecx, LENGTHOF arr
    mov esi, OFFSET arr
print:
    mov eax, [esi]
    call WriteDec
    mov eax, 32
    call WriteChar
    add esi, 4
    loop print

    exit
main ENDP
END main
