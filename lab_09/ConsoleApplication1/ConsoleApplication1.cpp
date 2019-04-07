// ConsoleApplication1.cpp: определяет точку входа для консольного приложения.
//

#include "stdafx.h"
extern "C" void p1(int N, int *g);

int N = 6, NF = 7;
int _tmain(int argc, _TCHAR* argv[])
{
	p1(N, &NF);
	printf("Factorial of %d is %d", N, NF);
	return 0;
}
