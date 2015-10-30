# ZYCompiler lexer
# Author 	: zjw
# Date		: 2015-07-10

lexer:lex.l
	flex lex.l
	gcc -o $@ $(DEBUGFLAG) lex.yy.c -lfl

clean:
	rm -rf lexer lex.yy.c
