
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

; add your code here   

           
chaine db ?
tab db 13,1,25,6,4,8,0,9,11   
mov ax,0
mov cx, 9 
mov bl,0 

mov si, offset tab 

 beline:
 
   add bl, [si]  
   inc si 

loop beline
 
mov cx, 9  
dec  si
cmp bl,100
ja label  

btr:
mov [si],200 
add dx, [si]
dec si

loop btr 
  

mov si,offset chaine[4]
mov [si], '$'
mov al,bl
mov bl,10


biline:
dec si
mov ah,0
div bl
add ah,48
mov [si],ah
test al,al
jnz biline

mov dx,si 
mov ah, 9h
int 21h   


   jmp fin  
   
label:
sub [si],5
mov al,[si] 
dec  si
loop label 
mov bl,0  
mov cx, 9 
inc si
jmp beline 

fin:
mov ah, 4ch
int 21h
ret




