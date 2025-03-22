; Task: 1 Write a program that uses a loop to calculate the first ten numbers of Fibonacci sequence.

INCLUDE Irvine32.inc
.data
  fibArray DWORD 10 DUP(?)
  count DWORD 10
  msg byte "Fibonacci sequence: ", 0

.code
main PROC
  mov edx, OFFSET msg
  call WriteString
  call Crlf

  mov eax, 0        
  mov ebx, 1          
  mov esi, OFFSET fibArray 

  mov [esi], eax        
  add esi, 4
  mov [esi], ebx    
  add esi, 4

  call WriteDec
  call Crlf
  call WriteDec
  call Crlf

  mov ecx, 8           
Fibonacci:
  mov edx, eax         
  add eax, ebx        
  mov ebx, edx        
  mov [esi], eax      
  add esi, 4      

  call WriteDec
  call Crlf
  loop Fibonacci   

exit
main endp
end main
