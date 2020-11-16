%option noyywrap

%%

(" "|"\n")int|uint" "  { printf("\n************\ntip podataka: %s\n************\n", yytext);} // tip podatka
if(\n|" ")*\(.+\)(\n|" ")?("{".*"}")?\n.+\n.*else(\n|" ")*("{".*"}")?\n.+ { printf("\n************\nif izraz: %s\n************\n", yytext);} // if else

%%

int main() {
  yylex();
}
