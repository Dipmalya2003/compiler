#include <stdio.h>
#include <string.h>

int isValid(char str[],int n){
	int i=0;
	if(!((str[0] >= 'a' && str[0] <= 'z') ||
		(str[0] >= 'A' && str[0] <= 'Z') ||
		str[0] == '_')){
			return 0;
		}
		
	for (i =1;i<n;i++){
		if(!((str[i] >= 'a' && str[i] <= 'z') ||
		(str[i] >= 'A' && str[i] <= 'Z') ||
		(str[i] >= '0' && str[i] <= '9') ||
		str[0] == '_'))
			return 0;
	}
	return 1;
}

int main(){
	char str[50];
	printf("Enter the string:\n");
	scanf("%s",str);
	int length = strlen(str);
	if(isValid(str,length)){
		printf("Valid\n");
	}else{
		printf("Invalid\n");
	}
	return 0;
}