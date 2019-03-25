@echo on
MASM.EXE /ZI main.asm,,,;
MASM.EXE /ZI input.asm,,,;
MASM.EXE /ZI hex.asm,,,;
MASM.EXE /ZI bin.asm,,,;
MASM.EXE /ZI dec.asm,,,;
link.exe /CO main.obj input.obj hex.obj bin.obj dec.obj,,,;
del *.obj
del *.crf
del *.lst
del *.map