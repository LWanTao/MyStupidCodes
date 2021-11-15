#include <stdbool.h>
#include <stdio.h>
#include "stdlib.h"

#define ERROR -1

typedef int ElementType;
typedef struct LNode *PtrToLNode;
typedef PtrToLNode Position;
typedef PtrToLNode List;

struct LNode{
    ElementType Data;
    PtrToLNode Next;
};

int Length(List L){
    Position p;
    int cnt = 0;
    p = L;
    while(p){
        p = p->Next;
        cnt++;
    }
    return cnt;
}

bool IfHeadExist(List L){
    int sum;
    Position p,h;
    p = L->Next; //p指向第二个数据
    h = L; //h指向第一个数据
    while (p){    //累加除了第一个数据以外的所有存在数据
        sum = sum + p->Data;
        p = p->Next;
    }
    if(sum < h->Data){
        return true;
    }else{return false;}
}

ElementType FindKth(List L, int K){
    Position p;
    int cnt = 1;
    p = L;
    while (p && cnt<K){
        p = p->Next;
        cnt++;
    }
    if((cnt == K) && p){
        if(IfHeadExist(L)){p=p->Next;return p->Data;}
        else{return p->Data;}
        }
    else{
        return ERROR;}
}

bool Insert(List L, ElementType X, int i){
    Position tmp,pre;
    int cnt = 0;

    pre = L;
    while(pre && cnt<i-1){
        pre = pre->Next;
        cnt++;
    }
    if(pre==NULL || cnt!=i-1){
        printf("插入位置参数错误\n");
        return false;
    }
    else{
        tmp = (Position)malloc(sizeof(struct LNode));
        tmp->Data=X;
        tmp->Next=pre->Next;
        pre->Next=tmp;
        return true;
    }
}

bool Delete(List L, int i){
    Position tmp, pre;
    int cnt = 0;

    pre = L;
    while (pre && cnt<i-1){
        pre = pre->Next;
        cnt++;
    }
    if(pre==NULL || cnt!=i-1 || pre->Next==NULL){
        printf("删除位置参数错误\n");
        return false;
    }
    else{
        tmp = pre->Next;
        pre->Next = tmp->Next;
        free(tmp);
        return true;
    }
}

void PrintList(List L){                      //打印链表所有内容
    Position p;
    p = L;
    printf("|表长：%d", Length(L));
    printf("|当前数组内容: ");
    while(p){
        printf(" — %d — ",p->Data);
        p = p->Next;
    }
    printf("\n\n");
}

List MakeEmpty(){
    List L;
    L = (List)malloc(sizeof(struct LNode));
    return L;
}

int main(){
    List L;
//    Position p;
//    p = L;
//    p->Data = 0;
    int i;
    printf("///链表初始化完毕...///\n");
    PrintList(L);
    printf("///依次插入5组有效数据中...///\n");
    for(i=1;i<=5;i++){Insert(L,i,i);}
    PrintList(L);
    printf("///查找第3个有效数据中...///\n");
    printf("第3个有效数据是：%d\n\n",FindKth(L,3));
//    printf("///请输入要查找的数据位序...///\n");
//    scanf("%d",k);
//    printf("第%d个有效数据是%d",k, FindKth(L,k));
    printf("///删除第3个有效数据中...///\n");
    Delete(L,1);
    PrintList(L);
    return 0;
}