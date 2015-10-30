%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
%}

%union
{
	char *str;
	int num;
};

%token 

%%
