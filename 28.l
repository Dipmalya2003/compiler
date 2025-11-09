%{
#include <stdio.h>
int comm=0;
FILE *fp;
%}

%%
"//".* {comm++;}
"/*"([^*]|[\n])*"*/" {comm++;}
.  {fputc(yytext[0],fp);}
\n {fputc('\n',fp);}
%%

int main(){
	FILE *input;
	char infile[50],outfile[50];
	
	printf("Enter the filename:\n");
	scanf("%s",infile);
	
	printf("Enter the out filename:\n");
	scanf("%s",outfile);
	
	input = fopen(infile,"r");
	fp = fopen(outfile,"w");
	
	yyin = input;
	yylex();
	
	printf("No of comm:%d\n",comm);
	printf("new file:%s\n",outfile);
	
	fclose(input);
	fclose(fp);
	
	return 0;
	
}

int yywrap(){
	return 1;
}