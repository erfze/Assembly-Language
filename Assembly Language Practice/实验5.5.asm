assume cs:code
a segment
	db 1,2,3,4,5,6,7,8
a ends

b segment
	db 1,2,3,4,5,6,7,8
b ends

c segment
	db 8 dup (0)
c ends

code segment
	start:	mov ax,c
			mov ds,ax
			mov ax,a
			mov ss,ax
			mov bx,0
			mov bp,0
			mov cx,8
	s:		mov al,[bp]
			add [bx],al
			mov ax,b
			mov ss,ax
			mov al,[bp]
			add [bx],al
			mov ax,a
			mov ss,ax
			inc bp
			inc bx
			loop s
			mov ax,4c00h
			int 21h
code ends

end start