; ����������: ��������� ������� �� ������� ��������� �
;             � �������  ������� ������� , ��� �������
;             ���������� � ������� AL
; �������...: DS:DX - ����� ������;
;             ������� DOS :
;             09h ������ �� ������� ������,
;             07h ������ ������ ��� ���,
;             4Ch ��������� ������� ;
;             INT 21h - �����  ������� DOS
;
StkSeg  SEGMENT PARA STACK 'STACK'
        DB      200h DUP (?)
StkSeg  ENDS
;
DataS   SEGMENT WORD 'DATA'
HelloMessage    DB   13                ;������ ��������� � ���. ������
                DB   10                ;��������� ������ �� ���. ������
                DB   'Hello, world !'  ;����� ���������
                DB   '$'               ;������������ ��� ������� DOS
DataS   ENDS
;
Code    SEGMENT WORD 'CODE'
        ASSUME  CS:Code, DS:DataS
DispMsg:
        mov   AX,DataS                 ;�������� � AX ������ �������� ������
        mov   DS,AX                    ;��������� DS
        mov   DX,OFFSET HelloMessage   ;DS:DX - ����� ������
        mov   AH,9                     ;��=09h ������ �� ������� ������
        int   21h                      ;�����  ������� DOS
        mov   AH,7                     ;��=07h ������ ������ ��� ���
        INT   21h                      ;�����  ������� DOS
        mov   AH,4Ch                   ;��=4Ch ��������� �������
        int   21h                      ;�����  ������� DOS
Code    ENDS
        END   DispMsg
