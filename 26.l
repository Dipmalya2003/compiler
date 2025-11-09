%{
#include <stdio.h>
int space=0,word=0,charc=0,endl=0;

%}

%%
[\t]+   {space += yyleng;}
\n    {endl++;}
[^ \t\n]+ {word++;charc+=yyleng;}
.  {charc+=yyleng;}
%%

int main(){
	FILE *input;
	char infile[50];
	printf("Enter the filename:\n");
	scanf("%s",infile);
	
	input = fopen(infile,"r");
	yyin = input;
	
	yylex();
	printf("%d %d %d %d",space,word,charc,endl);
	fclose(input);
	return 0;
}

int yywrap(){
	return 1;
}
