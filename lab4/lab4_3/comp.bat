@echo off

set file=%1

masm /zi %file%,,,,;
link /co %file%,,,,;
del *.obj
del *.crf
del *.lst
del *.map
%file%.exe