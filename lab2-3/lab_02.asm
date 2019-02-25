SSTACK     SEGMENT PARA STACK  'STACK'
                DB   64 DUP('СТЕК____')
     SSTACK     ENDS

     DSEG          SEGMENT  PARA PUBLIC 'DATA'
     CA        DB      'A'
     KA        DB      '65'
     TXT       DB      'символ "'
     C$        DB      ?
               DB      '" имеет код '
    KCH1       DB      ?
    KCH2       DB      ?
               DB      10,13,'$'
    MSG0       DB      'НАЧАЛО РАБОТЫ',13,10,'$'
    MSG1       DB      'КОНЕЦ  РАБОТЫ',13,10,'$'
     DSEG          ENDS

SUBTTL         ОСНОВНАЯ ПРОГРАММА
PAGE
     CSEG      SEGMENT PARA PUBLIC 'CODE'
               ASSUME CS:CSEG,DS:DSEG,SS:SSTACK

     BEGIN     PROC FAR
     ; занести в стек такие начальные значения, чтобы программа
     ; могла возвратить управление MS DOS (отладчику) по RET.
               PUSH  DS ; поместить в стек номер параграфа адреса возврата
               MOV  AX,0
               PUSH  AX

     ; загрузить адрес сегмента данных DS
     M1:       MOV  AX,DSEG
               MOV  DS,AX

     ; вывод текста "НАЧАЛО РАБОТЫ"
     M2:       MOV  AH,9
               MOV  DX,OFFSET MSG0
               INT  21H

     ; вывод стоки "СИМВОЛ 'A' имеет код 65"
     MA:       MOV  AL,CA
               MOV  C$,AL
                  MOV  AX,WORD PTR KA
                  MOV  WORD PTR KCH1,AX
               MOV  AH,9
               MOV DX,OFFSET TXT
               INT  21H

     ; вывод стоки "СИМВОЛ 'B' имеет код 66"
     MB:       INC  C$
               INC  KCH1+1
               INT  21H

     ; вывод стоки "СИМВОЛ 'C' имеет код 67"
     MC:       INC  C$
               INC  KCH1+1
               INT  21H

     ; вывод текста "КОНЕЦ  РАБОТЫ"
     M3:       MOV  AH,9
               MOV  DX,OFFSET MSG1
               INT  21H

     ; возвратить управление MS DOS (отладчику)
               RET
     BEGIN     ENDP

     CSEG      ENDS
               END  BEGIN