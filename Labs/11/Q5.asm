INCLUDE Irvine32.inc

.data
  arr byte 1,2,3,4,5,6,7,8,9
  multi byte 20
.code

LOAD proto,
    arr1:PTR byte,multiplier:byte

main PROC
    INVOKE LOAD, ADDR arr, multi
    mov ecx,lengthof arr
    mov esi,0
    mov eax,0
    L1:
    mov al,arr[esi]
    call writeint
    call crlf
    inc esi
    loop L1

    exit
main ENDP

LOAD proc,
    arr1:PTR byte,multiplier:byte
    mov esi,arr1
    mov edi,arr1
    mov ecx,lengthof arr

    L1:
    lodsb
    mul multiplier
    stosb
    loop L1
    ret
LOAD endp

END main
