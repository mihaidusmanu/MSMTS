%{
    open Ast
    open Lexing
%}
%token Newline Tequal Tnotequal Eof
%token <int> Variable
%token <int * int> Intro

%start formula
%type <Ast.formula> formula

%%
formula:
| info = Intro Newline expr = clause* Eof                       { (fst info, snd info, expr) }

clause:
| l = literal* Newline                                          { l }

literal:
| x = Variable Tequal y = Variable                              { Equal (x, y) }
| x = Variable Tnotequal y = Variable                           { Notequal (x, y) }


