include irvine32.inc

.data
	str1 byte "Hello World", 0
	msg1 byte "Original: ", 0
	msg2 byte "Reversed: ", 0

strReverse proto,
	len: dword,
	string: ptr byte

.code
	main proc
		invoke strReverse, lengthof str1, addr str1

		exit
	main endp

	strReverse proc,
		len: dword,
		string: ptr byte

		mov edx, offset msg1
		call writestring
		mov edx, string
		call writestring
		call crlf

		dec len
		
		mov esi, string
		mov edi, string
		add edi, len
		dec edi
		mov ecx, len
		shr ecx, 1

		l1:
			mov al, [esi]
			xchg al, [edi]
			mov [esi], al
			inc esi
			dec edi
		loop l1

		mov edx, offset msg2
		call writestring
		mov edx, string
		call writestring
		call crlf

		ret
	strReverse endp
end main
