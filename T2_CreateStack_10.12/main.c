#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

#define ERROR -1

typedef int ElementType;
typedef int Position;
typedef struct SNode * PtrToSNode;
typedef PtrToSNode Stack;


struct SNode{
    ElementType * Data;
    Position Top;
    int MaxSize;
};
Stack CreateStack(int MaxSize){
    Stack S = (Stack)malloc(sizeof(struct SNode));
    S->Data = (ElementType *) malloc(MaxSize *sizeof(ElementType));
    S->Top = -1;
    S->MaxSize = MaxSize;
    return S;
}
bool IsFull(Stack S){
    return(S->Top == S->MaxSize-1);
}
bool Push(Stack S, ElementType X){
    if(IsFull(S)){
        printf("///STACK OVERFLOW///");
        return false;
    } else{
        S->Data[++(S->Top)] = X;
        return true;
    }
}
bool IsEmpty(Stack S){
    return(S->Top == -1);
}
ElementType Pop(Stack S){
    if(IsEmpty(S)){
        printf("///STACK IS EMPTY///");
        return ERROR;
    }else{
        return(S->Data[(S->Top)--]);
    }
}
void PrintStack(Stack S){
    int cnt = 0;
    printf("\nThe elements of the stack is:");
    while(cnt<=S->Top){
        printf("  %d  ",S->Data[cnt]);
        cnt++;
    }
}
int main(){
    Stack S;int i;
    S = CreateStack(10);
    for(i=1;i<=10;i++) {
        Push(S, i);
    }
    PrintStack(S);
    Pop(S);
    PrintStack(S);
    Pop(S);
    PrintStack(S);
    Pop(S);
    PrintStack(S);
    return 0;
}