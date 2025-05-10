; 21 = 2^4 + 2^2 + 2^1

INCLUDE Irvine32.inc

.data
    ;
.code

main PROC
    call ReadInt
    mov ecx, 0

    mov ebx, eax
    shl ebx, 4
    add ecx, ebx

    mov ebx, eax
    shl ebx, 2
    add ecx, ebx

    add ecx, eax

    mov eax, ecx

    call WriteDec
    exit
main ENDP
END main
