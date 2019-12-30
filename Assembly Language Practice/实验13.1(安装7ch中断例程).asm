assume cs:code

code segment

start:	mov ax,cs
		mov ds,ax
		mov si,offset show
		mov ax,0
		mov es,ax
		mov di,200h
		mov cx,offset show_end-offset show
		cld
		rep movsb

		mov ax,0
		mov es,ax
		mov word ptr es:[7ch*4],200h
		mov word ptr es:[7ch*4+2],0
		mov ax,4c00h
		int 21h

show:		mov ch,0

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
			iret

show_end:	nop

code ends
end start