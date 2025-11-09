%{
#include <stdio.h>
int v=0,c=0;
%}

%%
[aeiouAEIOU] {v++;}
[a-zA-z] {c++;}

%%

int main(){
	printf("Enter the string:");
	yylex();
	printf("Vowel no.: %d\n",v);
	printf("Consonant no.: %d\n",c);
	return 0;
}

int yywrap(){
 return 1;
}