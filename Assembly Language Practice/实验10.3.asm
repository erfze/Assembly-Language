assume cs:code,ss:stack,ds:data

data segment
	db 10 dup (0)
data ends

stack segment
	db 16 dup (0)
stack ends

code segment
start:	mov ax,12666
		mov bx,data
		mov ds,bx
		mov si,0
		mov bx,stack
		mov ss,bx
		mov sp,10h
		mov cx,0
		mov bx,10
		call dtoc

		mov dh,8
		mov dl,3
		mov cl,2
		mov si,0
		call show_str
		mov ax,4c00h
		int 21h

dtoc:	push cx
begin:	mov dx,0
		div bx
		add dx,30h
		push dx
		mov cx,ax
		jcxz tran
		jmp begin
tran:	pop dx
		mov byte ptr [si],dl
		inc si
		mov cx,dx
		jcxz quit_dtoc
		jmp tran
quit_dtoc:	ret

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
			add di,320h
			mov al,2
			dec dl
			mul dl
			add di,ax	;定位第3列

			mov al,2

copy:		mov cl,[si]
			jcxz quit_show
			mov byte ptr es:[di],cl
			mov byte ptr es:[di+1],al
			inc si
			add di,2
			jmp short copy

quit_show:	pop cx
			pop di
			pop es
			pop dx
			pop ax
			ret

code ends
end start