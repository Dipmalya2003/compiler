%{
#include <stdio.h>
int sc=0,pc=0;
FILE *fp;
%}

%%
scanf {fprintf(fp,"readf");sc++;}
printf {fprintf(fp,"writef");pc++;}
.  {fputc(yytext[0],fp);}
\n {fputc('\n',fp);}
%%

int main(){
	FILE *input;
	char infile[50],outfile[50];
	printf("Enter the infile:\n");
	scanf("%s",infile);
	
	printf("Enter the outfile:\n");
	scanf("%s",outfile);
	
	input = fopen(infile,"r");
	fp = fopen(outfile,"w");
	
	yyin = input;
	yylex();
	
	printf("Scanf count:%d\n",sc);
	printf("printf count:%d\n",pc);
	printf("new file:%s\n",outfile);
	
	fclose(input);
	fclose(fp);
	
	return 0;
	
}

int yywrap(){
return 1;
}