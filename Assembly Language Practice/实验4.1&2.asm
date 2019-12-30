assume cs:code

code segment
	
	mov ax,20H
	mov ds,ax
	
	mov bx,0
	
	mov cx,40H

s:  mov ds:[bx],bx
	inc bx

	loop s

	mov ax,4C00H
	int 21H

code ends

end