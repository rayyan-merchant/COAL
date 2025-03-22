INCLUDE Irvine32.inc

.data
employees DWORD 5
Ids DWORD 5 DUP(?)
names BYTE 5 DUP(20 DUP(?))
birthyear DWORD 5 DUP(?)
annualSalary DWORD 5 DUP(?)
msg1 BYTE 'Enter Employee ID: ', 0
msg2 BYTE 'Enter Employee Name: ', 0
msg3 BYTE 'Enter Year of Birth: ', 0
msg4 BYTE 'Enter Annual Salary: ', 0
msg5 BYTE 'Total Annual Salary: ', 0

.code
main PROC
    mov ecx, employees  
    mov esi, 0
    mov edi, 0

L1: 
    ; Prompt for Employee ID
    mov edx, OFFSET msg1
    call WriteString
    call ReadDec
    mov [Ids + esi], eax

    ; Prompt for Employee Name
    mov edx, OFFSET msg2
    call WriteString
    mov edx, OFFSET names
    add edx, edi
    mov ecx, 20
    call ReadString

    ; Prompt for Year of Birth
    mov edx, OFFSET msg3
    call WriteString
    call ReadDec
    mov [birthyear + esi], eax

    ; Prompt for Annual Salary
    mov edx, OFFSET msg4
    call WriteString
    call ReadDec
    mov [annualSalary + esi], eax

    add esi, TYPE DWORD  
    add edi, 20        
    
    call Crlf
    loop L1 

    ; Salary Calculation
    mov ecx, employees
    mov esi, OFFSET annualSalary
    mov eax, 0  ; Initialize sum

L2: 
    add eax, [esi]
    add esi, TYPE DWORD
    loop L2

    ; Display
    mov edx, OFFSET msg5
    call WriteString
    call WriteInt
    call Crlf

    exit
main ENDP
END main
