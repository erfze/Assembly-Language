assume cs:code,ss:stack

;X=dx*10000H+ax
;N=cx
;H=dx
;L=ax
;X/N=int(H/N)*10000H+[rem(H/N)*10000H+L]/N

stack segment
	db 16 dup (0)
stack ends

code segment
start:	mov ax,stack
		mov ss,ax
		mov sp,10h
		mov ax,4240h
		mov dx,000Fh
		mov cx,0Ch

		call divdw

		mov ax,4c00h
		int 21h

divdw:	push ax
		mov ax,dx
		mov dx,0
		div cx	;int(H/N)*10000H
		
		pop bx
		push ax
		mov ax,bx
		div cx
		mov cx,dx	;[rem(H/N)*10000H+L]/N
		pop dx	
		ret
code ends
end start