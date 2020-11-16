%option noyywrap

%%

(" "|"\n")int|uint" "  { printf("\n************\ntip podataka: %s\n************\n", yytext);} // tip podatka
if(\n|" ")*\(.+\)(\n|" ")?("{".*"}")?\n.+\n.*else(\n|" ")*("{".*"}")?\n.+ { printf("\n************\nif izraz: %s\n************\n", yytext);} // if else


sad radim ovo 16.11.
[+-]?((0|[1-9][0-9]{1,9})|0b[01]{1,32}|0x[a-fA-F0-9]{1,8}) {return INT_NUM_VALUE; }
"struct"                {return KW_STRUCT; }

%%

int main() {
  yylex();
}
