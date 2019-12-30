assume cs:code

code segment	
s0: db '/','/',' ',':',':',0
s:  db 9,8,7,4,2,0

start:	mov ax,0B800h
		mov es,ax
		mov ax,cs
		mov ds,ax
		mov si,offset s0
		mov di,offset s
		mov bp,7D0h
cmos_access0:	mov bl,ds:[di]
				mov bh,ds:[si]
				call cmos_access
				mov cx,bx
				jcxz quit
				inc di
				inc si
				add bp,6
				jmp cmos_access0
cmos_access:	mov al,bl
				out 70h,al
				in al,71h

				mov ah,al
				mov cl,4
				shr ah,cl
				and al,00001111b

				add ah,30h
				add al,30h
				mov byte ptr es:[bp],ah
				mov byte ptr es:[bp+2],al
				mov byte ptr es:[bp+4],bh
				ret
quit:	mov ax,4c00h
		int 21h
code ends
end start