Help по листингу в 12 лабе. 

В командной строке:  
```
ml /c /Fl /EP
```

Флаги:  
**/c** - Транслирует без линковки (для создания только объектных файлов)  
**/Fl** - Создаёт файл листинга трансляции (Создаётся текстовый файл, который помогает понять, во что транслируется каждая строка исходников.)  
**/EP** - Отправляет листинг препроцессора на поток вывода stdout (консольный вывод)  