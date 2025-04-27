include irvine32.inc

.data
	var DWORD 0
	msg1 BYTE "Hello", 0
	msg2 BYTE "World", 0

.code
main PROC
	while_loop:
		mov eax, var
		cmp eax, 5
		jge else_block
		
    mov edx, offset msg1
		call writestring
		inc eax
		mov var, eax
		cmp eax, 10
		jle while_loop
		
  else_block:
		mov edx, offset msg2
		call writestring
		inc eax
		mov var, eax
		cmp eax, 10
		jle while_loop
	
  end_code:
main endp
end main
