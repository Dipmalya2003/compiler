%{
#include <stdio.h>
int com=0;
%}

%%
([Aa]nd)|([Bb]ut)|([Ww]hile)|([Aa]lthough)   {com=1;}
[\t\n]+ ;
%%

int main(){
	char str[50];
	printf("Enter the string:\n");
	scanf("%s",str);
	
	yylex();
	 if(com){
		printf("Compound");
	 }else{
		printf("simple");
	 }
	 return 0;
}
int yywrap(){
	return 1;
}

