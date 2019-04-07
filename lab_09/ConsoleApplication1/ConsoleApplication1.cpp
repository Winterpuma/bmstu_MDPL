// ConsoleApplication1.cpp: определяет точку входа для консольного приложения.
//

#include "stdafx.h"
extern "C" void p1(int N, int *g);
extern "C" void factorial_loop(int N, int *g);
extern "C" void factorial_stack(int N, int *g);

int N = 5, NF = 1;

void fact_stack(int N, int *NF)
{
	if (N)
	{
		*NF *= N;
		fact_stack(N - 1, NF);
	}
}

int _tmain(int argc, _TCHAR* argv[])
{
	factorial_stack(N, &NF);
	printf("Factorial of %d is %d", N, NF);
	return 0;
}
