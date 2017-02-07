%{
#include<iostream>
using namespace std;
#include "calci.tab.h"

#define YY_DECL extern "C" int yylex()
%}

%%

"+"       { return ADD; }
"-"       { return SUB; }
"*"       { return MUL; }
"/"       { return DIV; }
"|"       { return ABS; }
"\n"      { return EOL; }
[0-9]+    { yylval.number = atoi(yytext); return INT; }
.         { printf("Mystry character "); }

%%
