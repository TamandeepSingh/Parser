bison -d calci.y
flex calci.l
g++ calci.tab.c lex.yy.c -lfl
