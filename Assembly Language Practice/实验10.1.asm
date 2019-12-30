assume cs:code,ds:data,ss:stack

data segment
	db 'Welcome to masm!',0
data ends

stack segment
	db 16 dup (0)
stack ends

code segment
start:	mov dh,8
		mov dl,3
		mov cl,2
		mov ax,data
		mov ds,ax
		mov si,0
		mov ax,stack
		mov ss,stack
		mov sp,10h
		call show_str

		mov ax,4c00h
		int 21h
show_str:	mov ch,0

			push ax
			push dx
			push es 
			push di 
			push cx


			mov ax,0B800h
			mov es,ax

			mov al,0A0h
			dec dh
			mul dh
			mov di,ax	;定位第8行

			mov al,2
			dec dl
			mul dl
			add di,ax	;定位第3列

			mov al,2

copy:		mov cl,[si]
			jcxz quit
			mov byte ptr es:[di],cl
			mov byte ptr es:[di+1],al
			inc si
			add di,2
			jmp short copy

quit:		pop cx
			pop di
			pop es
			pop dx
			pop ax
			ret
code ends
end start