INCLUDE Irvine32.inc

.data
    ;
.code

ThreeProd PROC
    push ebp
    mov ebp, esp

    mov eax, [ebp + 8]
    mov ebx, [ebp + 12]
    mul ebx
    mov ebx, [ebp + 16]
    mul ebx
    call WriteDec

    pop ebp
    ret 16
ThreeProd ENDP

main PROC
    push 4
    push 3
    push 2
    call ThreeProd

    exit
main ENDP
END main
