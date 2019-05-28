// lab12.cpp: определяет точку входа для консольного приложения.
//

#include "stdafx.h"

extern "C" void START();
extern "C" void SIN();

int _tmain(int argc, _TCHAR* argv[])
{
    START();
	SIN();

	return 0;
}

