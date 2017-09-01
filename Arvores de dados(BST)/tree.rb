require_relative 'Node'

def new_node(tree, key)
  new_node = Node.new
  new_node.key = key

  tree_aux = tree

  unless tree_aux
    return new_node
  else
    while true
        # puts tree_aux.key
        if tree_aux.key > key
          unless tree_aux.left
            tree_aux.left = new_node
            return tree
          else
            tree_aux = tree_aux.left
          end
        elsif tree_aux.key < key
          unless tree_aux.right
            tree_aux.right = new_node
            return tree
          else
            tree_aux = tree_aux.right
          end
        end
    end
  end
  tree
end

tree = nil
tree = new_node(tree, 5)
tree = new_node(tree, 7)
tree = new_node(tree, 4)
tree = new_node(tree, 6)

puts tree.key
puts tree.left.key
puts tree.right.key
puts tree.right.left.key
