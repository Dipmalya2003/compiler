#include <stdio.h>
#include <string.h>
#include <ctype.h>

char stack[50],infix[50],postfix[50];
int stack2[50];
int top=-1,top2=-1;

void push(char symbol){
	stack[++top] = symbol;
}

char pop(){
	return stack[top--];
}

void push2(int symbol){
	stack2[++top2] = symbol;
}

int pop2(){
	return stack2[top2--];
}

int precedence(char symbol){
	switch(symbol){
		case '#': return 0;
		case '(': return 1;
		case '+':
		case '-': return 2;
		case '*':
		case '/': return 3;
		case '^': return 4;
		default : return 0;
	}
}

void infix_to_postfix(char infix[]){
	char symbol,temp;
	int i=0,pos=0;
	push('#');
	while((symbol = infix[i++]) != '\0'){
		if(isalnum(symbol)){
			postfix[pos++] = symbol;
		}else if(symbol == '('){
			push(symbol);
		}else if(symbol == ')'){
			while(stack[top] != '('){
				postfix[pos++] = pop();
			}
			pop();
		}else{
			while(precedence(stack[top]) >= precedence(symbol)){
				postfix[pos++] = pop();
			}
			push(symbol);
		}
	}
	while(stack[top] != '#'){
		postfix[pos++] = pop();
	}
	postfix[pos] = '\0';
}

int evaluate_to_postfix(char postfix[]){
	int num,n1,n2,n3,i=0;
	char symbol;
	while((symbol = postfix[i++]) != '\0'){
		if(isdigit(symbol)){
			num = symbol - '0';
			push2(num);
		}else{
			n1 = pop2();
			n2 = pop2();
			
			switch(symbol){
				case '+': n3 = n2+n1; break;
				case '-': n3 = n2-n1; break;
				case '*': n3 = n2*n1; break;
				case '/': n3 = n2/n1; break;
				case '^': n3 = n2^n1; break;
			}
			push2(n3);
		}
	}
	printf("Result:%d\n",pop2());
}

int main(){
	char infix[50];
	printf("Enter the infix: \n");
	scanf("%s",infix);
	
	infix_to_postfix(infix);
	printf("Postfix: %s\n",postfix);
	
	evaluate_to_postfix(postfix);
	
	return 0;
	
}