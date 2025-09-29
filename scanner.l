/* 
   Date: 09/25/25
   Author: Mackenzie Treadway

   scanner.l
   ----------------------
   This is the Flex scanner file.
   It reads the input text and breaks it into tokens (keywords, numbers, operators, etc.)
   These tokens are then sent to the parser for syntax checking.
*/

%{
#include <cstdio>
#include <string>
#include <vector>

using namespace std;

#include "values.h"
#include "listing.h"
#include "tokens.h"
%}

%option noyywrap

ws		[ \t\r]+
comment		"//".*\n
line		[\n]
id		[A-Za-z]([A-Za-z0-9])*
digit		[0-9]
dec		{digit}+
char		'.'
punc		[\(\),:;]

%%

{ws}		{ ECHO; }
{comment}	{ ECHO; nextLine(); }
{line}		{ ECHO; nextLine(); }
"+"		{ ECHO; yylval.oper = ADD; return(ADDOP); }
"*"		{ ECHO; yylval.oper = MULTIPLY; return(MULOP); }
"&"		{ ECHO; yylval.oper = AND; return(ANDOP); }
"<"		{ ECHO; yylval.oper = LESS; return(RELOP); }
"=>"		{ ECHO; return(ARROW); }
begin		{ ECHO; return(BEGIN_); }
case		{ ECHO; return(CASE); }
character	{ ECHO; return(CHARACTER); }
end		{ ECHO; return(END); }
endswitch	{ ECHO; return(ENDSWITCH); }
function	{ ECHO; return(FUNCTION); }
integer		{ ECHO; return(INTEGER); }
is		{ ECHO; return(IS); }
list		{ ECHO; return(LIST); }
of		{ ECHO; return(OF); }
others		{ ECHO; return(OTHERS); }
returns		{ ECHO; return(RETURNS); }
switch		{ ECHO; return(SWITCH); }
when		{ ECHO; return(WHEN); }

{id}		{ ECHO; yylval.iden = (CharPtr)malloc(yyleng + 1); 
			strcpy(yylval.iden, yytext); return(IDENTIFIER);}
{dec}		{ ECHO; yylval.value = atoi(yytext); return(INT_LITERAL); }
{char}		{ ECHO; yylval.value = yytext[1]; return(CHAR_LITERAL); }
{punc}		{ ECHO; return(yytext[0]); }
.		{ ECHO; appendError(LEXICAL, yytext); }

%%
