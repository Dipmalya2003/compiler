%{
#include <stdio.h>
int pi=0,ni=0,pf=0,nf=0;
%}

%%
[-][0-9]+  {ni++;}
[+]?[0-9]+ {pi++;}
[-][0-9]+\.[0-9]+ {nf++;}
[+]?[0-9]+\.[0-9]+ {pf++;}
%%


int main(){
	printf("Enter the number: ");
	yylex();
	printf("ni:%d\n",ni);
	printf("pi:%d\n",pi);
	printf("nf:%d\n",nf);
	printf("pf:%d\n",pf);
	return 0;
}

int yywrap(){
	return 1;
}