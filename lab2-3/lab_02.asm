SSTACK     SEGMENT PARA STACK  'STACK'
                DB   64 DUP('����____')
     SSTACK     ENDS

     DSEG          SEGMENT  PARA PUBLIC 'DATA'
     CA        DB      'A'
     KA        DB      '65'
     TXT       DB      '������ "'
     C$        DB      ?
               DB      '" ����� ��� '
    KCH1       DB      ?
    KCH2       DB      ?
               DB      10,13,'$'
    MSG0       DB      '������ ������',13,10,'$'
    MSG1       DB      '�����  ������',13,10,'$'
     DSEG          ENDS

SUBTTL         �������� ���������
PAGE
     CSEG      SEGMENT PARA PUBLIC 'CODE'
               ASSUME CS:CSEG,DS:DSEG,SS:SSTACK

     BEGIN     PROC FAR
     ; ������� � ���� ����� ��������� ��������, ����� ���������
     ; ����� ���������� ���������� MS DOS (���������) �� RET.
               PUSH  DS ; ��������� � ���� ����� ��������� ������ ��������
               MOV  AX,0
               PUSH  AX

     ; ��������� ����� �������� ������ DS
     M1:       MOV  AX,DSEG
               MOV  DS,AX

     ; ����� ������ "������ ������"
     M2:       MOV  AH,9
               MOV  DX,OFFSET MSG0
               INT  21H

     ; ����� ����� "������ 'A' ����� ��� 65"
     MA:       MOV  AL,CA
               MOV  C$,AL
                  MOV  AX,WORD PTR KA
                  MOV  WORD PTR KCH1,AX
               MOV  AH,9
               MOV DX,OFFSET TXT
               INT  21H

     ; ����� ����� "������ 'B' ����� ��� 66"
     MB:       INC  C$
               INC  KCH1+1
               INT  21H

     ; ����� ����� "������ 'C' ����� ��� 67"
     MC:       INC  C$
               INC  KCH1+1
               INT  21H

     ; ����� ������ "�����  ������"
     M3:       MOV  AH,9
               MOV  DX,OFFSET MSG1
               INT  21H

     ; ���������� ���������� MS DOS (���������)
               RET
     BEGIN     ENDP

     CSEG      ENDS
               END  BEGIN