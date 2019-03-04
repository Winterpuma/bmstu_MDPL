@echo off

set file=%1
set file2=%2

masm /zi %file%,,,,;
masm /zi %file2%,,,,;
link /co %file% %file2%,,,,;
del *.obj
del *.crf
del *.lst
del *.map
%file%.exe