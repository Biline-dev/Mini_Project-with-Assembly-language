
data segment 
   tab db 'GCAACCGCCAACGCGTATGA-GCGCGGATGCGCGCGGATGC-TTACGCGTAAAATGCGCATT-CTTCCGCACATCCCGCTACT-GCACGATGGTACCGGTCGCC-CCTGCCATGGTGTGATCCGC-CCGCTACTGCCGTCATCGCC-AAAATAGGCGCCACAGAAAC-GCAGAGGGGAAGGGGAGACG-CGCTCCTTCGGCTTCCTCGC-GTCCGGACCGTGCTGACCCC-AAAATAGGCGCCACAGAAAC-$' 
   taille db 0
   tabe db 20 dup (?)               
data ends 

code segment
   
   assume cs:code, ds:data
     
     
     
     
  palindrome proc near                                   
      ;je calcule la taille de ma chaine                  
      
      tail:
      call tai_mot                

       
     label:   
        mov tabe[di],'$' 
            mov si,0
            mov ax,0 
            mov ax,di 
            dec di
            mov bl,2
            div bl  
            mov cl,al


     ;le parcours de la chaine
   strict:
            mov al,tabe[si]
            mov bl,tabe[di]
            cmp al,bl
            jnz label2  ;si la chaine n'est pas palindrome on ne l'affiche sans changement de couleur.
            inc si
            dec dI
    loop strict
    
    jmp color  ;si la chaine est palindrome je la met en rouge et je l'affiche.

     ;procedure de la taille:
     proc Tai_mot near
        
      cmp tab[si], '-'  
      
      je label     ;je saute si tab[si]=='-'
  
      mov al,tab[si] 
      mov tabe[di],al       ;je met ma chaine dans un tableau
      inc si
      inc taille
      inc di
      
      jmp Tai_mot  ;je saute si la chaine n'est pas fini  
       
      
     endp Tai_mot   
     endp palindrome
  



main:     

    start:
    mov ax,data
    mov ds,ax   
    
    
     mov ax,0
     mov si,0   
     mov cx,0
     mov di,0  
     mov bx,0   
     
      bel:
 
    call palindrome       ;je fais l'appelle a la fonction   
    
    boom:
         
    mov ax,0             
    mov si,0  
    mov cx,0
    mov di,0  
    mov al,taille 
    add si,ax                             
    cmp tab[si+1],'$'      ;si tab[si+1]=$ alors on sort du programme
    je fin
    inc taille   
    inc si
    jmp bel
    
    
    ;changement de couleur
    color:   
     mov si,0   
     mov al,0
     mov ah,09h
     mov bx,4 
     mov cl,20
     int 10h
     
      mov dx,offset tabe
      mov ah,09h
      int 21h 
      jmp boom
     
     
    
    jmp fin   
       
      
     
       fin:
       mov ah, 4ch
       int 21h  
       
       
     label2:
       
      mov dx,offset tabe
      mov ah, 9h
      int 21h 
      jmp boom
    

  

     code ends

     end main 
       
