assume cs:codesg,ds:table,ss:data

data segment
 
        db '1975', '1976', '1977', '1978', '1979', '1980', '1981', '1982', '1983'
        db '1984', '1985', '1986', '1987', '1988', '1989', '1990', '1991', '1992'
        db '1993', '1994', '1995'

        dd 16,22,382,1356,2390,8000,16000,24486,50065,97479,140417,197514
        dd 345980,590827,803530,1183000,1843000,2759000,3753000,4649000,5937000

        dw 3,7,9,13,28,38,130,220,476,778,1001,1442,2258,2793,4037,5635,8226
        dw 11542,14430,15257,17800

data ends
 
 
table segment

        db 21 dup ('year summ ne ?? ')

table ends

codesg segment
start:	mov ax,table
		mov ds,ax
		mov ax,data
		mov ss,ax
		mov bx,0
		mov bp,0
		mov cx,21
s:		mov dx,cx
		mov si,0
		mov cx,4
s0:		mov al,[bp]
		mov [bx].0h[si],al
		inc si
		inc bp
		loop s0
		add bx,16
		mov cx,dx
		loop s
		mov bx,0
		mov cx,21
s1:		mov dx,cx
		mov si,0
		mov cx,4
s2:		mov al,[bp]
		mov [bx].5h[si],al
		inc si
		inc bp
		loop s2
		add bx,16
		mov cx,dx
		loop s1
		mov bx,0
		mov cx,21
s3:		mov dx,cx
		mov si,0
		mov cx,2
s4:		mov al,[bp]
		mov [bx+10+si],al
		inc si
		inc bp
		loop s4
		add bx,16
		mov cx,dx
		loop s3
		mov bx,0
		mov cx,21
s5:		mov dx,[bx+7h]
		mov ax,[bx+5h]
		div word ptr [bx+10]
		mov [bx+13],ax
		add bx,16
		loop s5
		mov ax,4c00h
		int 21h
codesg ends

end start