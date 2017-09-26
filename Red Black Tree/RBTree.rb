require_relative 'Node'

RED = "RED"
BLACK = "BLACK"


def new_node(tree, key)
  new_Node = Node.new
  new_Node.key = key

  new_nil = Node.new

  puts "NEW NODE"

  tree_aux = tree
  if tree_aux == nil
    new_Node.color = BLACK
    return new_Node
  else
    if key < tree_aux.key
      if tree_aux.left == nil
        if tree_aux.color == RED
          new_Node.color = BLACK
        else
          new_Node.color = RED
        end
        tree_aux.left = new_Node
      else
        tree_aux = new_node(tree_aux.left, key)
        # tree_aux.left = new_nil
      end
    elsif key > tree_aux.key
      if tree_aux.right == nil
        if tree_aux.color == RED
          new_Node.color = BLACK
        else
          new_Node.color = RED
        end
        tree_aux.right = new_Node
      else
        tree_aux = new_node(tree_aux.right, key)
        # tree_aux.right = new_nil
      end
    end
  end 
  tree
end

def rotateRight(node_h)
	x = node_h.left
	node_h.left = x.right
	x.right = node_h
	x.color = h.color
	h.color = "RED"
	x.number_subnodes = node_h. number_subnodes
	node_h.number_subnodes = 1 + size(h.left) + size(h.right)
	x
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

puts tree.key
puts tree.left.key
puts tree.right.key