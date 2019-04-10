#include "stdafx.h"
#include <conio.h>
#include <iostream>
// puma
#define N 5 // Size of matr to transpose
#define B 8 // Size of all matr

using namespace std;

unsigned char matr[B][B] = {
	{1,1,1,1,1},
	{2,2,2,2,2},
	{3,3,3,3,3},
	{4,4,4,4,4},
	{5,5,5,5,5}
};

void print_matr()
{
	for (int i = 0; i < N; i++)
	{
		for (int j = 0; j < N; j++)
			printf("%d ", matr[i][j]);
		printf("\n");
	}
	printf("\n");
}

int main(int argc, char * argv[])
{
	print_matr();

	_asm
	{
		MOV   EBX, OFFSET  matr
		MOV   ECX, N-1

	OuterLoop:
		MOV EAX, ECX
		MOV EDI, B
		MOV ESI, 1
	InnerLoop:
		XCHG DH, [EBX][ESI]
		XCHG DH, [EBX][EDI]
		XCHG DH, [EBX][ESI]

		ADD EDI, B
		INC ESI
		LOOP InnerLoop

		ADD EBX, B+1
		MOV ECX, EAX
		LOOP OuterLoop
	}

	print_matr();

	for (int i = 0; i < N; i++)
	{
		for (int j = i + 1; j < N; j++)
		{
			char tmp = matr[i][j];
			matr[i][j] = matr[j][i];
			matr[j][i] = tmp;
		}
	}

	print_matr();

	printf("\n");
	return 0;
}
