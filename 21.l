%{
#include <stdio.h>
int sc =0 ,pc=0;
FILE *fp;
%}

%%
scanf {fprintf(fp,"readf"); sc++;}
printf {fprintf(fp,"writef"); pc++;}
. {fputc(yytext[0],fp);}
\n {fputc('\n',fp);}
%%

int main(){
  FILE *input;
  char infile[50],outfile[50];
  
  printf("Enter the in filename:\n");
  scanf("%s",infile);
  
  printf("Enter the out filename:\n");
  scanf("%s",outfile);
  
  input = fopen(infile,"r");
  fp = fopen(outfile,"w");
  
  yyin = input;
  yylex();
  printf("no of scanf:%d\n",sc);
  printf("no of printf:%d\n",pc);
  
  printf("New file: %s\n",outfile);
  
  fclose(input);
  fclose(fp);
  
  return 0;
}

int yywrap(){
return 1;
}