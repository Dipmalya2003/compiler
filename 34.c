#include <stdio.h>
#include <string.h>

int isValid(char line[]){
	if(line[0] == '/' && line[1] == '/' && line[2] != '/'){
		return 1;
	}
	if(line[0] == '/' && line[1] == '*' && line[strlen(line)-2] == '*' && line[strlen(line)-1] == '/'){
		return 1;
	}
	return 0;
}

int main(){
	char line[50];
	printf("Enter the string:\n");
	scanf("%s",line);
	if(isValid(line)){
		printf("\nValid");
	}else{
		printf("\nInValid");
	}
	return 0;
}