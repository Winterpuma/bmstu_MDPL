// ConsoleApplication1.cpp: определяет точку входа для консольного приложения.
//

#include "stdafx.h"
extern "C" void p1(int N, int *g);
extern "C" void factorial_loop(int N, int *g);
extern "C" void factorial_stack(int N, int *g);
extern "C" void factorial_registers(int N, int *g);

int N = 7, NF = 1;

int main(int argc, char* argv[])
{
 	factorial_loop(N, &NF);
	printf("Factorial of %d is %d", N, NF);
	return 0;
}
