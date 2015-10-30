%option yylineno nodefault noyywrap

%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
%}

IDENTIFIER		[a-zA-Z_][a-zA-Z0-9_]*
INTEGER			0|([1-9][0-9]*)

%%

auto		{ printf("lineno: %d, KEYWORD: %s\n", yylineno, yytext); }
break		{ printf("lineno: %d, KEYWORD: %s\n", yylineno, yytext); }
case		{ printf("lineno: %d, KEYWORD: %s\n", yylineno, yytext); }
char		{ printf("lineno: %d, KEYWORD: %s\n", yylineno, yytext); }
const		{ printf("lineno: %d, KEYWORD: %s\n", yylineno, yytext); }
continue	{ printf("lineno: %d, KEYWORD: %s\n", yylineno, yytext); }
default		{ printf("lineno: %d, KEYWORD: %s\n", yylineno, yytext); }
do			{ printf("lineno: %d, KEYWORD: %s\n", yylineno, yytext); }
double		{ printf("lineno: %d, KEYWORD: %s\n", yylineno, yytext); }
else		{ printf("lineno: %d, KEYWORD: %s\n", yylineno, yytext); }
enum		{ printf("lineno: %d, KEYWORD: %s\n", yylineno, yytext); }
extern		{ printf("lineno: %d, KEYWORD: %s\n", yylineno, yytext); }
float		{ printf("lineno: %d, KEYWORD: %s\n", yylineno, yytext); }
for			{ printf("lineno: %d, KEYWORD: %s\n", yylineno, yytext); }
goto		{ printf("lineno: %d, KEYWORD: %s\n", yylineno, yytext); }
if			{ printf("lineno: %d, KEYWORD: %s\n", yylineno, yytext); }
int			{ printf("lineno: %d, KEYWORD: %s\n", yylineno, yytext); }
long		{ printf("lineno: %d, KEYWORD: %s\n", yylineno, yytext); }
register	{ printf("lineno: %d, KEYWORD: %s\n", yylineno, yytext); }
return		{ printf("lineno: %d, KEYWORD: %s\n", yylineno, yytext); }
short		{ printf("lineno: %d, KEYWORD: %s\n", yylineno, yytext); }
signed		{ printf("lineno: %d, KEYWORD: %s\n", yylineno, yytext); }
sizeof		{ printf("lineno: %d, KEYWORD: %s\n", yylineno, yytext); }
static		{ printf("lineno: %d, KEYWORD: %s\n", yylineno, yytext); }
struct		{ printf("lineno: %d, KEYWORD: %s\n", yylineno, yytext); }
switch		{ printf("lineno: %d, KEYWORD: %s\n", yylineno, yytext); }
typedef		{ printf("lineno: %d, KEYWORD: %s\n", yylineno, yytext); }
union		{ printf("lineno: %d, KEYWORD: %s\n", yylineno, yytext); }
unsigned	{ printf("lineno: %d, KEYWORD: %s\n", yylineno, yytext); }
void		{ printf("lineno: %d, KEYWORD: %s\n", yylineno, yytext); }
volatile	{ printf("lineno: %d, KEYWORD: %s\n", yylineno, yytext); }
while		{ printf("lineno: %d, KEYWORD: %s\n", yylineno, yytext); }
{IDENTIFIER}	{ printf("lineno: %d, IDENTIFIER: %s\n", yylineno, yytext); }
{INTEGER}		{ printf("lineno: %d, INTEGER: %s\n", yylineno, yytext); }
\n			{ yylineno++; }
[ \t]
.			{ printf("lineno: %d, UNKNOWN: %s\n", yylineno, yytext);}

%%

int main(int argc, char **argv)
{
	if (argc < 2)
	{ // 读取标准输入
		while (yylex() != 0);
	}
	else
	{ // 从文件中读取
		int i;
		for (i = 1; i < argc; i++)
		{
			FILE *pf = fopen(argv[i], "r");
			if (!pf)
			{
				perror(argv[i]);
				return -1;
			}
			yyrestart(pf);
			printf("--------------- begin file %s ---------------\n", argv[i]);
			yylex();
			printf("--------------- end file %s -----------------\n", argv[i]);
			fclose(pf);
		}
	}
	
	return 0;
}
