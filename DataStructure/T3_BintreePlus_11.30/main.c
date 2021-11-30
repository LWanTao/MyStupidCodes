#include<stdio.h>
#include<stdlib.h>
typedef char ElementType;
typedef struct TNode *Position; /* 结构体指针 */
typedef Position BinTree; /* 二叉树类型 */
struct TNode{ /* 树结点定义 */
    ElementType Data; /* 结点数据 */
    BinTree Left;     /* 指向左子树 */
    BinTree Right;    /* 指向右子树 */
}TNode;

void CreateBinaryTree ( BinTree *T ) {
    ElementType ch;
    scanf("%c",&ch);
    if (ch == '#')
        *T = NULL;
    else {
        *T = (BinTree)malloc(sizeof(TNode));
        (*T)->Data = ch;
        CreateBinaryTree(&((*T)->Left));
        CreateBinaryTree(&((*T)->Right));
    }
}

void PreOrderTraversal ( BinTree BT ) {
    if ( BT ) {
        printf("%c", BT->Data);
        PreOrderTraversal( BT->Left );
        PreOrderTraversal( BT->Right );
    }
}

void InOrderTraversal ( BinTree BT ) {
    if ( BT ) {
        InOrderTraversal( BT->Left );
        printf("%c", BT->Data);
        InOrderTraversal( BT->Right );
    }
}

void PostOrderTraversal ( BinTree BT ) {
    if ( BT ) {
        PostOrderTraversal( BT->Left );
        PostOrderTraversal( BT->Right );
        printf("%c", BT->Data);
    }
}

int GetHeight(BinTree BT){
    int HL,HR,MaxH;
    if(BT){
        HL = GetHeight(BT->Left);
        HR = GetHeight(BT->Right);
        MaxH = HL > HR ? HL : HR;
        return (MaxH+1);
    }
    else return 0;
}

int NodeCount(BinTree BT){
    int num = 0;
    if(BT == NULL) return 0;
    else if(BT->Left == NULL && BT->Right == NULL) return 1;
    else {
        num = NodeCount(BT->Left) + NodeCount(BT->Right);
        return (num+1);
    }
}

int LeafCount(BinTree BT){
    int num = 0;
    if(BT == NULL) return 0;
    else if(BT->Left == NULL && BT->Right == NULL) return 1;
    else {
        num = LeafCount(BT->Left) + LeafCount(BT->Right);
        return (num);
    }
}

int FullNodeCount(BinTree BT){
    int num = 0;
    if(BT == NULL) return 0;
    else if(BT->Left == NULL && BT->Right == NULL) num = FullNodeCount(BT->Right);
    else if(BT->Left == NULL && BT->Right != NULL) num = FullNodeCount(BT->Right);
    else if(BT->Left != NULL && BT->Right == NULL) num = FullNodeCount(BT->Left);
    else num = FullNodeCount(BT->Left) + FullNodeCount(BT->Right) + 1;
    return num;
}

int main() {
    BinTree myTree;
    printf("Create your Binary Tree:\n");
    CreateBinaryTree(&myTree);
    printf("\n PreOrder:");
    PreOrderTraversal(myTree);
    printf("\n InOrder:");
    InOrderTraversal(myTree);
    printf("\n PostOrder:");
    PostOrderTraversal(myTree);
    printf("\n The height of this tree is: %d",GetHeight(myTree));
    printf("\n The amount of nodes on this tree is: %d",NodeCount(myTree));
    printf("\n The amount of leaves on this tree is: %d",LeafCount(myTree));
    printf("\n The amount of full nodes on this tree is: %d",FullNodeCount(myTree));
    return 0;
}