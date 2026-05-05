/* definitions */
ALPHA		[a-zA-Z_\b]
DIGIT		[0-9]
ALPHADIGIT	{ALPHA}|{DIGIT}
NAME		{ALPHA}{ALPHADIGIT}+
%%
/* rules */
%%
/* user code */