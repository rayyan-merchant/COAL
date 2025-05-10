include irvine32.inc

.data
	nums DWORD 4 DUP(?)
	prompt BYTE "Enter a number: ", 0
	end1 BYTE "All nums are equal", 0
	end2 BYTE "Nums arent equal", 0

.code
main PROC
	mov ecx, 0
	mov ebx, 4
	mov edx, offset prompt
	mov esi, offset nums
	
  input_loop:
		inc ecx
		call writestring
		call readint
		
    mov [esi], eax
		add esi, 4
		cmp ecx, ebx
		jl input_loop
	  
  mov esi, offset nums
	mov eax, [esi]
	cmp eax, [esi+4]
	jne not_equal
	
  add esi, 4
	mov eax, [esi]
	cmp eax, [esi+4]
	jne not_equal
	
  add esi, 4
	mov eax, [esi]
	cmp eax, [esi+4]
	jne not_equal
	
  mov edx, offset end1
	call writestring
	jmp end_code
	
  not_equal:
		mov edx, offset end2
		call writestring
	
  end_code:
  main endp
end main
