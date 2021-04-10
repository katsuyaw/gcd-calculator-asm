INCLUDE Irvine32.inc

.data
msg1 BYTE "GCD of the following numbers: ",0
msg2 BYTE ", ", 0
val1 DWORD ?
val2 DWORD ?

.code
main PROC

   mov val1,30
   mov val2,10
   call print
   call getGCD

   mov val1,60
   mov val2,30
   call print
   call getGCD

exit
main ENDP

print PROC
mov edx, OFFSET msg1
call WriteString
   mov eax,val1
   call WriteDec
    mov edx, OFFSET msg2
    call WriteString
   mov eax,val2
   call WriteDec
    call crlf
   ret

print ENDP


getGCD PROC

mov eax,val1
cdq
mov ebx,val2
div ebx

L1:
   mov eax,ebx
   mov ebx,edx
   cmp ebx,0
   je DONE
   mov val1, edx
   cdq
   div ebx
   loop L1

DONE:
   call WriteDec
   call crlf
   ret

getGCD ENDP

END main

