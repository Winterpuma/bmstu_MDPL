; Примечание: Программа выводит на дисплей сообщение и
;             и ожидает  нажатия клавиши , код символа
;             помещается в регистр AL
; Справка...: DS:DX - адрес строки;
;             Функции DOS :
;             09h выдать на дисплей строку,
;             07h ввести символ без эха,
;             4Ch завершить процесс ;
;             INT 21h - вызов  функции DOS
;
StkSeg  SEGMENT PARA STACK 'STACK'
        DB      200h DUP (?)
StkSeg  ENDS
;
DataS   SEGMENT WORD 'DATA'
HelloMessage    DB   13                ;курсор поместить в нач. строки
                DB   10                ;перевести курсор на нов. строку
                DB   'Hello, world !'  ;текст сообщения
                DB   '$'               ;ограничитель для функции DOS
DataS   ENDS
;
Code    SEGMENT WORD 'CODE'
        ASSUME  CS:Code, DS:DataS
DispMsg:
        mov   AX,DataS                 ;загрузка в AX адреса сегмента данных
        mov   DS,AX                    ;установка DS
        mov   DX,OFFSET HelloMessage   ;DS:DX - адрес строки
        mov   AH,9                     ;АН=09h выдать на дисплей строку
        int   21h                      ;вызов  функции DOS
        mov   AH,7                     ;АН=07h ввести символ без эха
        INT   21h                      ;вызов  функции DOS
        mov   AH,4Ch                   ;АН=4Ch завершить процесс
        int   21h                      ;вызов  функции DOS
Code    ENDS
        END   DispMsg
