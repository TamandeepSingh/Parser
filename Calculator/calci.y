%{
#include<iostream>
using namespace std;
extern "C" int yylex();
extern "C" int yyparse();
void yyerror(const char *);

%}

/* declaring tokens */
%union{
  int number;
}

%token <number> INT;
%token ADD;
%token SUB;
%token MUL;
%token DIV;
%token ABS;
%token EOL;

%type <number> exp;
%type <number> factor;

%%

calclist:
  | calclist exp EOL { }
  ;

exp: factor {cout << $$ << endl; }
  | exp ADD factor { $$ = $1 + $3; cout << $$ << endl;}
  | exp SUB factor { $$ = $1 - $3; cout << $$ << endl;}
  ;

factor: INT
  | INT MUL INT { $$ = $1 * $3; }
  | INT DIV INT { $$ = $1 / $3; }
  ;

%%

int main(int, char **)
{
    int tok;
    while (tok = yyparse()){
     }
}
void yyerror(const char *s) {
    cout << "EEK, parse error!  Message: " << s << endl;
    // might as well halt now:
    exit(-1);
}
