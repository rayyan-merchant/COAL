include Irvine32.inc

.data
  arr1 dword 1,2,3,4,5,6,7,8,9,8,7,6,5,4,3,2
  m1 byte "Min: ",0
  m2 byte "Max: ",0
.code

main proc 
   
    push offset arr1
    call MinMaxArray
    exit
main endp

MinMaxArray proc 
    push ebp
    mov ebp, esp

    mov esi, [ebp+8]    

    mov ecx,lengthof arr1
    mov ebx,10000 ;min
    mov eax,0 ;max
    L1:
    cmp eax,[esi]
    jg cont
    mov  eax,[esi]
    cont:
    cmp ebx,[esi]
    jl next
    mov ebx,[esi]
    next:
    add esi,4
    loop L1

    mov edx, offset m2
    call writestring
    call WriteInt
    call Crlf           

    mov edx, offset m1
    call writestring
    mov eax,ebx
    call WriteInt
    call Crlf    
    pop ebp
    ret 4             
MinMaxArray endp

end main

