require_relative 'Node'

RED = "RED"
BLACK = "BLACK"


def new_node(tree, key)
  new_Node = Node.new
  new_Node.key = key
  new_nil = Node.new

  tree_aux = tree
  if tree_aux == nil
    new_Node.color = BLACK
    return new_Node
  else
    if key < tree_aux.key
      if tree_aux.left == nil
        tree_aux.color == RED ? new_Node.color = BLACK : new_Node.color = RED
        tree_aux.left = new_Node
      else
        tree_aux = new_node(tree_aux.left, key)
      end
    elsif key > tree_aux.key
      if tree_aux.right == nil
        tree_aux.color == RED ? new_Node.color = BLACK : new_Node.color = RED
        tree_aux.right = new_Node
      else
        tree_aux = new_node(tree_aux.right, key)
      end
    end
  end
  tree
end

def rotate_left(tree)
  root_key = tree.right.key
  left_key = tree.key
  tree.right.right ? right_key = tree.right.right.key : right_key = nil

  new_tree = nil
  new_tree = new_node(new_tree, root_key)
  new_tree = new_node(new_tree, left_key)
  new_tree = new_node(new_tree, right_key)

  return new_tree
end

def rotate_right(tree)
  root_key = tree.left.key
  tree.left.left ? left_key = tree.left.left.key : left_key.key = nil
  right_key = tree.key

  new_tree = nil
  new_tree = new_node(new_tree, root_key)
  new_tree = new_node(new_tree, left_key)
  new_tree = new_node(new_tree, right_key)

  return new_tree
end

def verifica_casos_insercao(tree)
  if tree.left == nil && tree.right != nil
    tree = rotate_left(tree)
    return tree
  end

  if tree.right == nil && tree.left != nil && tree.left.left
    tree = rotate_right(tree)
    return tree
  end

  return tree
end

def minValueNode(tree)
  currentNode = tree

  while currentNode.left != nil
    currentNode = currentNode.left
  end

  return currentNode
end

def preorder(tree)
  if tree
    puts tree.key
    preorder tree.left
    preorder tree.right
  end
end

def inorder(tree)
  if tree
    inorder tree.left
    puts tree.key
    inorder tree.right
  end
end

def postorder(tree)
  if tree
    postorder tree.left
    postorder tree.right
    puts tree.key
  end
end

tree = nil
tree = new_node(tree, 8)
tree = new_node(tree, 10)
tree = new_node(tree, 23)
tree = new_node(tree, 6)
tree = new_node(tree, 9)
tree = new_node(tree, 0)
tree = new_node(tree, 12)
tree = new_node(tree, 35)
tree = new_node(tree, 24)
tree = new_node(tree, 15)
tree = new_node(tree, 3)
preorder(tree)
# inorder(tree)
