#include "stdafx.h"
#include <conio.h>
#include <iostream>
// Puma
#define N 5 // Size of matr to transpose
#define B 8 // Size of all matr

using namespace std;
/*
unsigned char matr[B][B] = {
	{1,1,1,1,1,1},
	{2,2,2,2,2,2},
	{3,3,3,3,3,3},
	{4,4,4,4,4,4},
	{5,5,5,5,5,5},
	{6,6,6,6,6,6}
};*/

unsigned char matr[B][B] = {
	{1,1,1,1,1},
	{2,2,2,2,2},
	{3,3,3,3,3},
	{4,4,4,4,4},
	{5,5,5,5,5}
};

void print_matr()
{
	for (int i = 0; i < B; i++)
	{
		for (int j = 0; j < B; j++)
			printf("%d ", matr[i][j]);
		printf("\n");
	}
	printf("\n");
}

int _tmain(int argc, _TCHAR* argv[])
{
	print_matr();

	_asm {
		mov EBX, offset matr
		mov ECX,N-1
OuterLoop: 
		lea ESI,[EBX+1]
		lea EDI,[EBX+B]

InnerLoop:
		XCHG AL,[ESI]
		XCHG AL,[EDI]
		XCHG AL,[ESI]

		inc ESI
		ADD EDI,B

		mov EAX,1
		ADD EAX,ECX

		ADD EAX,EBX
		cmp ESI,EAX
		jb InnerLoop
		jmp CheckOuterLoop

CheckOuterLoop:
		ADD EBX,B+1
		Loop OuterLoop	
	}

	print_matr();

	printf("\n");
	system ("pause");
	return 0;
}
