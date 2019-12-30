assume ds:data,cs:code,ss:stack

data segment
	db 'Welcome to masm!'
data ends

stack segment
	dw 3 dup (0)
stack ends

code segment
	
start:	mov ax,data
		mov ds,ax

		mov ax,stack
		mov ss,ax
		mov sp,6

		mov ax,71h
		push ax
		mov ax,24h
		push ax
		mov ax,02h
		push ax

		add si,7C0H
		mov ax,0B800H
		mov es,ax
		mov cx,3
print:	mov dx,cx
		mov bx,0
		pop ax
		mov cx,16
s:		mov ah,ds:[bx]
		mov es:[si],ah
		mov es:[si+1],al
		inc bx
		add si,2
		loop s
		mov cx,dx
		sub si,32
		add si,0A0H
		loop print
		mov ax,4c00h
		int 21h
code ends
end start