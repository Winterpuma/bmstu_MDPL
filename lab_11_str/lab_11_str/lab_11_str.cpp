// lab_11_str.cpp : Этот файл содержит функцию "main". Здесь начинается и заканчивается выполнение программы.
//

#include "pch.h"
#include <iostream>

extern "C" int StrLength(char *s);
extern "C" char* CopyStr(char *s1, char *s2, int L); // s1 - источник, s2 - приёмник
extern "C" int DelSpace(char *s);

void print_out(char* str, int i)
{
	int lenStr;

	lenStr = StrLength(str);
	printf("str%d : %s - %d\n", i, str, lenStr);
}

void new_line()
{
	printf("\n");
}

int main()
{
	char str1[80] = "1234567";
	char str2[80] = "";
	char str3[80] = "     6556   7667    ";
	char *tmpPtr;

	print_out(str1, 1);
	print_out(str2, 2);
	new_line();

	tmpPtr = CopyStr(str1, str2, StrLength(str1)); //lenStr2

	print_out(str1, 1);
	print_out(str2, 2);
	new_line();

	print_out(str3, 3);
	int len = DelSpace(str3);
	printf("returned new len: %d\n", len);
	print_out(str3, 3);

	return 0;
}