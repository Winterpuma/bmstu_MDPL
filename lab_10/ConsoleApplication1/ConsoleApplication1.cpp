// ConsoleApplication1.cpp: ���������� ����� ����� ��� ����������� ����������.
//
#include "stdafx.h"
extern "C" void START(void);


int _tmain(int argc, _TCHAR* argv[])
{
	_asm
	{
		call START
	}

	//getchar();
	return 0;
}

