%{
#include <stdio.h>
int id=0;
%}

%%
[a-zA-Z_][a-zA-Z0-9_]* {id++;}
[\t\n]+ ;
. ;
%%

int main(){
	FILE *input;
	char infile[50];
	
	printf("Enter the file name:\n");
	scanf("%s",infile);
	
	input = fopen(infile,"r");
	
	yyin = input;
	yylex();
	printf("No of id:%d\n",id);
	
	fclose(input);
	
	return 0;
}

int yywrap(){
	return 1;
}