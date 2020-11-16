%{
  #include <stdio.h>
  int yylex(void);
  int yyparse(void);
  int yyerror(char *);
  extern int yylineno;
%}

%token  COMMENT

%token  KW_IF
%token  KW_ELSE
%token  KW_RETURN
%token  KW_TYPE_INT
%token  KW_TYPE_UNSIGNED
%token  KW_TYPE_BOOL

%token  PARENT_L
%token  PARENT_R
%token  BRACKET_L
%token  BRACKET_R
%token  SEMICOLON
%token  COMMA
%token  ID

%token  INT_NUM_VALUE
%token  BOOL_VALUE

%token  ADD_SUB_OP
%token  RELATION_OP
%token  ASSIGN_OP
%token  AND_OP
%token  OR_OP
%token  NOT_OP
%token  XOR_OP

%%

program
  : function_list
  ;


function_list
  : function
  | function_list function
  ;

function
  : function_init SEMICOLON
  | function_init function_body 
  ;

type
  : KW_TYPE_INT
  | KW_TYPE_UNSIGNED
  | KW_TYPE_BOOL
  ;

function_init
  : type ID PARENT_L parameter_list PARENT_R 
  ;

function_body
  : BRACKET_L variable_list statement_list BRACKET_R
  ;

parameter_list
  : parameter
  | parameter_list COMMA parameter
  ;

parameter
  : /* there can be no parameters */
  | type ID
  ;


variable_list
  : /* there can be no variables */
  | variable_list variable
  ;

variable
  : variable_init
  | variable_def
  ;

variable_init
  : type ID SEMICOLON
  ;

variable_def
  : type ID ASSIGN_OP num_exp SEMICOLON
  ;


statement_list
  : /* there can be no statements */
  | statement_list statement
  ;

statement
  : compound_statement
  | assign_statement
  | if_statement
  | return_statement
  ;

compound_statement
  : BRACKET_L statement_list BRACKET_R 
  ;

assign_statement
  : ID ASSIGN_OP num_exp SEMICOLON;
  ;

num_exp
  : exp
  | num_exp ADD_SUB_OP exp
  ;

exp
  : literal
  | ID
  | function_call
  | PARENT_L num_exp PARENT_R
  ;

literal
  : INT_NUM_VALUE
  | BOOL_VALUE
  ;

function_call
  : ID PARENT_L argument_list PARENT_R
  ;

argument_list
  : argument
  | argument_list COMMA argument
  ;

argument
  : /* empty argument */
  | num_exp
  ;

if_statement
  : if_part
  | if_part else_part
  ;

if_part
  : KW_IF PARENT_L bool_exp PARENT_R statement
  ;

else_part
  : KW_ELSE statement
  ;

bool_exp
  : BOOL_VALUE
  | num_exp
  | num_exp RELATION_OP num_exp
  ;

return_statement
  : KW_RETURN num_exp SEMICOLON
  | KW_RETURN bool_exp SEMICOLON
  ;

%%

int main() {
  yyparse();
}

int yyerror(char *s) {
  fprintf(stderr, "line %d: SYNTAX ERROR %s\n", yylineno, s);
} 

