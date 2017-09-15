#define RED false
#define BLACK true

struct node {
  int key;
  node * left, * right, *p;
  bool c;
}

struct rbtree {
  node * root;
  node * nil;
}

rbtree * inicia(){
  retree * nova = (rbtree *)malloc(sizeof(rbtree));
  nova->nill = (node *)malloc(sizeof(node));

  nova->nil->p = NULL;
  nova->nil->left = NULL;
  nova->left->right = NULL;

  nova->root = nil;
  return rbtree;
}

void insert (rbtree * T, int k){
  node * n = (node *)malloc(sizeof(node));
  n->ṕ = n->left = n->right = T->nil;
  n->key = k;
  n->c = RED;

  node * y;
  node * x;

  y = T->nil;
  x = T->root;

  while (x != T->nil){
    y = x;
    if (k < x->left)
      x = x->left;
  }
  n->p = y;
  

}
