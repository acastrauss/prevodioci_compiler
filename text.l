%option noyywrap yylineno
%{
  #include "text.tab.h"
%}


%%

[ \t\n]+                { /*skip*/ }

"if"                    {return KW_IF; }
"else"                  {return KW_ELSE; }
"return"                {return KW_RETURN; }

"int"                   {return KW_TYPE_INT; }
"unsigned"              {return KW_TYPE_UNSIGNED; }
"bool"                  {return KW_TYPE_BOOL; }

"("                     {return PARENT_L; }
")"                     {return PARENT_R; }
"{"                     {return BRACKET_L; }
"}"                     {return BRACKET_R; }
";"                     {return SEMICOLON; }
","                     {return COMMA; }

"+"|"-"                 {return ADD_SUB_OP; }
"&&"|"and"              {return AND_OP; }
"||"|"or"               {return OR_OP; }
"!"|"not"               {return NOT_OP; }
"^"|"xor"               {return XOR_OP; }
">""="?|"<""="?|"=="    {return RELATION_OP; } // relacija
"="                     {return ASSIGN_OP; } // dodela

"true"|"false"          { return BOOL_VALUE; }
[a-zA-Z_][a-zA-Z0-9_]*  {return ID; } // identifikator
[+-]?((0|[1-9][0-9]{0,9})|0b[01]{1,32}|0x[a-fA-F0-9]{1,8}) {return INT_NUM_VALUE; }

("//".*)|("/*"(.*|\r|\n)*"*/") { /* SKIP */ } // komentari

.                       { printf("LEXICAL ERROR on line %d, unrecognized char '%c' .", yylineno, yytext[0]); }
