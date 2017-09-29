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

def verifica_casos_insercao(tree)
  if tree.left == nil && tree.right != nil
    tree.left = tree
    new_tree = tree.right
    tree.right = nil

    return new_tree
  end

  if tree.left != nil && tree.left.left != nil
    tree.left.right = tree
    new_tree = tree.left
    tree.left = nil
    return new_tree
  end

end

def preorder(tree)
  if tree
    puts tree.key
    preorder tree.left
    preorder tree.right
  end
end

tree = nil
tree = new_node(tree, 13)
tree = new_node(tree, 8)
tree = new_node(tree, 17)
tree = new_node(tree, 1)
tree = new_node(tree, 15)
tree = new_node(tree, 11)
tree = new_node(tree, 25)
tree = new_node(tree, 6)
tree = new_node(tree, 22)
tree = new_node(tree, 27)

preorder(tree)
puts
puts tree.key,tree.color
puts tree.left.key,tree.left.color
puts tree.right.key,tree.right.color
