#include <stdio.h>
#include "stdbool.h"
#include "stdlib.h"

#define ERROR -1

typedef struct SNode * PtrToSNode;
typedef int ElementType ;
typedef PtrToSNode Stack;


struct SNode{
    ElementType Data;
    PtrToSNode Next;
};

bool IsEmpty(Stack S){
    return(S->Next == NULL);
}

bool Push(Stack S,ElementType X){
    PtrToSNode TmpCell;

    TmpCell = (PtrToSNode)malloc(sizeof(struct SNode));
    TmpCell->Data = X;
    TmpCell->Next = S->Next;
    S->Next = TmpCell;
    return true;
}

ElementType Pop(Stack S){
    PtrToSNode FirstCell;
    ElementType TopElem;

    if(IsEmpty(S)){
        printf("///STACK IS EMPTY///");
        return ERROR;
    } else{
        FirstCell = S->Next;
        TopElem = FirstCell->Data;
        S->Next = FirstCell->Next;
        free(FirstCell);
        return TopElem;
    }
}

void PrintLinkStack(Stack S){
    Stack p = S->Next;
    printf("\nThe elements of Stack: ");
    while (p){
        printf("  %d  ",p->Data);
        p = p->Next;
    }
    printf("  //Done!");
}

main(){
    Stack S;int i;
    for(i=1;i<=10;i++){
        Push(S,i);
    }
    PrintLinkStack(S);
    Pop(S);
    PrintLinkStack(S);
    Pop(S);
    PrintLinkStack(S);
}