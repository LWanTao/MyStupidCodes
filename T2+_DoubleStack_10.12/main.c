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
    Position Top1;
    Position Top2;
    int MaxSize;
};
Stack CreateStack(int MaxSize){
    Stack S = (Stack)malloc(sizeof(struct SNode));
    S->Data = (ElementType *) malloc(MaxSize *sizeof(ElementType));
    S->Top1 = -1;
    S->Top2 = MaxSize;
    S->MaxSize = MaxSize;
    return S;
}
bool IsFull(Stack S,int Tag){
    if(Tag == 1) {
        return (S->Top1 == S->MaxSize - 1);
    } else{
        return (S->Top2 == S->MaxSize - 1);
    }
}
bool Push(Stack S, ElementType X, int Tag){
    if(IsFull(S,Tag)){
        printf("///STACK OVERFLOW///");
        return false;
    } else{
        if(Tag == 1)
        S->Data[++(S->Top1)] = X;
        else
        S->Data[++(S->Top2)] = X;
        return true;
    }
}
bool IsEmpty(Stack S, int Tag){
    if(Tag == 1){
        return(S->Top1 == -1);
    } else{
        return(S->Top2 == -1);
    }
}
ElementType Pop(Stack S, int Tag){
    if(IsEmpty(S,Tag)){
        printf("///STACK IS EMPTY///");
        return ERROR;
    }else{
        if(Tag == 1)
        return(S->Data[(S->Top1)--]);
        else
        return(S->Data[(S->Top2)++]);
    }
}
//void PrintStack(Stack S,int Tag){   ///双栈打印搞不定
//    int cnt = 0;
//    printf("The elements of the stack is:");
//    if(Tag == 1) {
//        while (cnt <= S->Top1) {
//            printf("  %d  ", S->Data[cnt]);
//            cnt++;
//        }
//    }else{
//        while (cnt <= S->Top2) {
//            printf("  %d  ", S->Data[cnt]);
//            cnt++;
//        }
//    }
//
//}
main(){
    Stack S;int i;
    S = CreateStack(10);
    for(i=1;i<=10;i++) {
        Push(S,i,1);
        Push(S,11-i,2);
    }
    Print
    Pop(S);
}