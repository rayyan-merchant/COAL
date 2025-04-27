include irvine32.inc

.data
	var DWORD 5
	x DWORD ?

.code
main PROC
	mov edx, var
	inc edx
	mov ecx, 10 ; lengthof array from task 2 used
	
  cmp var, ecx
	jge else_block
	
  cmp ecx, edx
	jl else_block
	
  mov x, 0
	jmp end_code
	
else_block:
		mov x, 1
	
end_code:
		mov eax, x
		call writedec
main endp
end main
