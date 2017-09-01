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

void destroy_key(nodo * tree, int value){

}

int search(nodo * tree, int value){
  nodo * tree_search = tree;

  do{
    if(tree_search != NULL){
      if(tree_search->info == value){
        return tree_search->info;
        break;
      }else {
        if(tree_search->info < value){

          tree_search = tree_search->left;

        }else if(tree_search->info > value){

          tree_search = tree_search->right;

        }
      }
    }else {
      return 0;
    }
  }while(1);

  return 0;
}

int sorteia_numero(){
  int numero_sorteado = 1 + (rand()%10);
  return numero_sorteado;
}

int main(){
  nodo * tree = inicialize();
  tree = insert(tree, 10);
  tree = insert(tree, 8);
  tree = insert(tree, 7);
  tree = insert(tree, 9);
  tree = insert(tree, 12);
  tree = insert(tree, 13);
  tree = insert(tree, 11);

  printf("Raiz: %d\n", tree->info);

  printf("Folha Esquerda: %d\n", tree->left->info);
  printf("Folha Esquerda -> Esquerda: %d\n", tree->left->left->info);
  printf("Folha Esquerda -> Direita: %d\n", tree->left->right->info);

  printf("Folha Direita: %d\n", tree->right->info);
  printf("Folha Direita -> Esquerda: %d\n", tree->right->left->info);
  printf("Folha Direita -> Direita: %d\n", tree->right->right->info);

  printf("\n\n Search: %d \n", search(tree, 8));
  return 0;
}
