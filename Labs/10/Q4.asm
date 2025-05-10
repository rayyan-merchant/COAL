include irvine32.inc

.data
    arr dword 4 DUP(?)
    flag dword 0
    m1 byte "Enter Four Numbers: ",0
    m2 byte "All Entered numbers are not prime",0
    m3 byte "Not Prime",0
    m4 byte "Prime",0
    m5 byte "Maximum prime: ",0

.code

largestPrime proto,
    arr1:ptr dword

CheckPrime proto,
    num: dword

main proc
    mov edx, offset m1
    call WriteString
    call Crlf

    mov ecx, lengthof arr
    mov esi, offset arr
L1:
    call ReadInt
    mov [esi], eax
    add esi, 4
loop L1


    mov ecx, lengthof arr
    mov esi, offset arr

L2:
    mov eax, [esi]
    invoke CheckPrime, eax
    cmp eax, 0
    je not_prime

    mov edx, offset m4
    call WriteString
    call Crlf
    jmp cont

not_prime:
    mov edx, offset m3
    call WriteString
    call Crlf
    mov flag,1
cont:
    add esi,4
loop L2

cmp flag,0
jne calllargest
jmp ddone

calllargest:
invoke largestPrime,addr arr

ddone:
    exit
main endp

CheckPrime proc,
    num: dword

    mov eax, num
    cmp eax, 2
    jl Not_prime    
    cmp eax, 2
    je Is_prime

    mov ecx, eax
    shr ecx, 1        
    mov ebx, 2

CheckLoop:
    mov eax, num
    xor edx, edx
    div ebx
    cmp edx, 0
    je Not_prime
    inc ebx
    cmp ebx, ecx
    jle CheckLoop

Is_prime:
    mov eax, 1
    ret

Not_prime:
    mov eax, 0
    ret

CheckPrime endp

largestPrime proc,
    arr1:ptr dword

    mov esi,arr1
    mov ecx,lengthof arr
    mov eax,0
    L1:
    cmp eax,[esi]
    jg cont
    mov eax,[esi]
    cont:
    add esi,4
    loop L1

    mov edx, offset m5
    call writestring
    call writeint
     ret
largestPrime endp

end main

