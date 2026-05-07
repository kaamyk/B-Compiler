/* definitions */
%x COMMENT

CONSTANT	{DIGIT}+|'[^']{1,2}'|"[^"]*"
NAME		{ALPHA}{ALPHADIGIT}{0,7}
ALPHADIGIT	{ALPHA}|{DIGIT}
ASSIGN		= ({BINARY}|{OPERATOR}){0,1}
WHITESPACE	[ \t\n]
SEP_OPEN	[({\[]
SEP_CLOSE	[)}\]]
SEP_SINGLE	[,;?:]
INDEC		++|--
OPERATOR	[-*&]	/*UNARY or BINARY*/
UNARY		!
BINARY		[+|<>%/]|==|!=|<=|>=|<<|>>
ALPHA		[a-zA-Z_\b]
DIGIT		[0-9]

%%

if				{ return IF; }
else			{ return ELSE; }
while			{ return WHILE; }
switch			{ return SWITCH; }
case			{ return CASE; }
goto			{ return GOTO; }
return			{ return RETURN; }
auto			{ return AUTO; }
extrn			{ return EXTRN; }
"/*"			{ BEGIN(COMMENT); }
<COMMENT>"*/"	{ BEGIN(INITIAL); }
<COMMENT>{CHAR}	{  }
{CONSTANT}		{ return CONSTANT; }
{NAME}			{ return NAME; }
{ASSIGN}		{ return ASSIGN; }
{WHITESPACE}	{  }
{SEP_OPEN}		{ return SEP_OPEN; }
{SEP_CLOSE}		{ return SEP_CLOSE; }
{SEP_SINGLE}	{ return SEP_SINGLE; }
{INDEC}			{ return INDEC; }
{OPERATOR}		{ return OPERATOR; }
{UNARY}			{ return UNARY; }
{BINARY}		{ return BINARY; }

%%

/* user code */

