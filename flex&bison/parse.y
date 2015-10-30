%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
%}

%union
{
	char* str;
	int num;
	double dou;
};

%token AUTO
%token BREAK
%token CASE
%token CHAR
%token CONST
%token CONTINUE
%token DEFAULT
%token DO
%token DOUBLE
%token ELSE
%token ENUM
%token EXTERN
%token FLOAT
%token FOR
%token GOTO
%token IF
%token INT
%token LONG
%token REGISTER
%token RETURN
%token SHORT
%token SIGNED
%token SIZEOF
%token STATIC
%token STRUCT
%token SWITCH
%token TYPEDEF
%token UNION
%token UNSIGNED 
%token VOID
%token VOLATILE
%token WHILE

%token<str> INENTIFIER
%token<num> INTEGER
%token<dou> FLOAT

%token LPAREN
%token RPAREN
%token ASSIGN
%token EQUAL

%%

%%

int main()
{
	
}
