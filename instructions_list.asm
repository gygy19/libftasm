;Intel x64 Assembly Instructions Infos By jguyet@student.42.fr
;-------------------------------------------------------------------------------
;Instruction |   arg1    |   arg2   |comments
mov           dest       ,src       ;(1)dest <-- src
mov           taille dest,src       ;(2)

movzx         dest       ,src       ;extension avec des 0 dans dest
movsx         dest       ,src       ;extension avec le bit de signe dans dest
              ;tailles possibles :
              ;byte     | 1 octet
              ;word     | 2 octets ou 1 mot
              ;dword    | 2 mots
              ;qword    | 4 mots
              ;tword    | 10 octets
              ;On utilise la taille pour lever l’ambigu¨ıt´e dans les instructions
              ;quand c’est n´ecessaire
lea           dest        ,[op]     ;dest <-- adresse de op (load effective address)
push          op                    ;decremente rsp et empile op
pop           op                    ;depile dans op et incremente rsp

inc           op                    ;incremente op
dec           op                    ;decremete op

cmp           reg1        ,reg2     ;(1)
ja            function              ;(2)(ce referer au registre rflags)jumps if CF = 0 and ZF = 0

cmp           reg1        ,reg2     ;(1)
jg            function              ;(2)(ce referer au registre rflags) jumps if ZF = 0 and SF = OF
