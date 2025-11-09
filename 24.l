%{
#include <stdio.h>
int comm=0;
FILE *fp;
%}

%%
"//".* {comm++;}
"/*"([^*]|[\n])*"*/" {comm++;}
. {fputc(yytext[0],fp);}
\n {fputc('\n',fp);}
%%

int main(){
	FILE *input;
	char infile[50],outfile[50];
	
	printf("Enter the in file:\n");
	scanf("%s",infile);
	
	printf("Enter the out file:\n");
	scanf("%s",outfile);
	
	input = fopen(infile,"r");
	fp = fopen(outfile,"w");
	
	yyin = input;
	yylex();
	
	printf("%d\n",comm);
	printf("%s\n",outfile);
	
	fclose(input);
	fclose(fp);
	return 0;
	
}

int yywrap(){
	return 1;
}