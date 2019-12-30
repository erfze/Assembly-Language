assume cs:codeseg,ds:datasg

datasg segment
	db "Beginner's All-purpose Symbolic Instruction Code.",0
datasg ends

codeseg segment

begin:	mov ax,datasg
		mov ds,ax
		mov si,0
		call letterc

		mov ax,4c00h
		int 21h

letterc:	mov ch,0
			mov cl,[si]
			mov dx,20H
			jcxz quit
			cmp byte ptr [si],61H
			jb s0
			cmp byte ptr [si],7AH
			ja s0
			sub [si],dx
s0:			inc si
			jmp short letterc
quit:		ret

codeseg ends
end begin