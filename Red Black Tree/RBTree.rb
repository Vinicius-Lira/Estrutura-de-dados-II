require_relative 'Node'

def new_node(tree, key)
  new_node = Node.new
  new_node.key = key

  tree_aux = tree

  unless tree_aux
    return new_node
  else
    while true
        if tree_aux.key > key
          unless tree_aux.left
            tree_aux.left = new_node
            return tree
            break
          else
            tree_aux = tree_aux.left
          end
        elsif tree_aux.key < key
          unless tree_aux.right
            tree_aux.right = new_node
            return tree
            break
          else
            tree_aux = tree_aux.right
          end
        end
    end
  end
  tree
end

def rotateRight(node_h){
	x = node_h.left
	node_h.left = x.right
	x.right = node_h
	x.color = h.color
	h.color = "RED"
	x.number_subnodes = node_h. number_subnodes
	node_h.number_subnodes = 1 + size(h.left) + size(h.right)
	x
}