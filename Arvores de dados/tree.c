#include <stdio.h>
#include <stdlib.h>

typedef struct no {
  int info;
  struct no * left,* right;
}nodo;

nodo * inicialize(){
  return NULL;
}

nodo * insert( nodo * tree , int value_insert){
  nodo * new = (nodo *)malloc(sizeof(nodo));
  new->info = value_insert;
  nodo * tree_p = tree;
  if (tree_p == NULL){
    return new;
  }else {
    do{
      if( value_insert < tree_p->info ){
        if(tree_p->left == NULL){
          tree_p->left = new;
          return tree;
          break;
        }else{
          tree_p = tree_p->left;
        }
      }else if(value_insert > tree_p->info){
        if(tree_p->right == NULL){
          tree_p->right = new;
          return tree;
          break;
        }else {
          tree_p = tree_p->right;
        }
      }
    }while(1);
  }

}

int main(){
  nodo * tree = inicialize();
  tree = insert(tree, 5);
  printf("%d\n", tree->info);
  return 0;
}
