/* definitions */
CONSTANT	{DIGIT}+|'{CHAR}{1,2}'|"{CHAR}*"
NAME		{ALPHA}{ALPHADIGIT}{0,7}
ALPHADIGIT	{ALPHA}|{DIGIT}
SEPARATOR	[(){}\[\],;?:]
COMMENTS	/\*.*\*/
ASSIGN		= {BINARY}{0,1}
INDEC		++|--
UNARY		[-!]
BINARY		[-+|&<>%*/]|==|!=|<=|>=|<<|>>
ALPHA		[a-zA-Z_\b]
DIGIT		[0-9]
CHAR		.|\n
%%
/* rules */
if|while|switch|goto|return	{
								printf("Keyword: %s\n", yytext);
						}
{NAME}

%%
/* user code */\*|\*//