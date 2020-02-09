data segment
n1  db  6,6,6,6,6,6
n2  db  1,2,3,4,5,6
n3 db  06h dup(0)
data ends

code segment
assume cs:code,ds:data
start: 
MOV ax,data
MOV  ds,ax
MOV  ah,00h
MOV  cl,06h
LEA  SI,n1
LEA  bx,n2
MOV  DI,offset n3

up:
MOV  al,[SI] 
MOV dl,[bx] 
SUB al,dl
MOV [DI],al
INC  SI
INC  bx
INC  DI
LOOP up
INT 3h 
code ends
end  start
