include irvine32.inc

.data 
    arr WORD 10, 4, 7, 14, 299, 156, 3, 19, 29, 300, 20

.code

bubblesort proto, arr1:PTR WORD, _size:BYTE

main proc
    invoke bubblesort, addr arr, lengthof arr
    exit
main endp

bubblesort proc, arr1:PTR WORD, _size:BYTE
    LOCAL temp:WORD, flag:BYTE
    LOCAL outer:BYTE

    movzx ecx, _size
    dec ecx
    mov outer, cl

L1:
    mov esi, arr1
    mov flag, 1          

    movzx ecx, _size
    dec ecx              

L2:
    mov ax, [esi]        ; AX = arr[i]
    mov dx, [esi+2]      ; DX = arr[i+1]
    cmp ax, dx
    jle cont             ; if arr[i] <= arr[i+1], no swap

    ; swap
    mov [esi], dx
    mov [esi+2], ax
    mov flag, 0

cont:
    add esi, 2
    loop L2

    cmp flag, 1
    je print              ; if no swaps, already sorted

    movzx ecx, outer
    dec outer
    jnz L1

print:
    mov esi, arr1
    movzx ecx, _size

print_loop:
    movzx eax, word ptr [esi]
    call WriteInt
    call Crlf
    add esi, 2
    loop print_loop

    ret
bubblesort endp

end main
