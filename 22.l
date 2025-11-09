%{
#include <stdio.h>
#include <string.h>
int com = 0;
%}

%%
([Aa]nd)|([Ww]ith)|([Bb]ecause)|([Aa]lthough)  {com=1;}
. ;
%%

int main(){

	printf("Enter the string:\n");
	yylex();
	if(com){
		printf("Compound\n");
	}else{
		printf("simple\n");
	}
	
	return 0;
}

int yywrap(){
	return 1;
}