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

def create_tree(number_node, tree)
  array = []
  counter = 1

  while counter <= 50
    array << counter
    counter = counter + 1
  end
  counter = 0
  while counter < number_node
    key = array.sample
    puts key
    tree = new_node(tree, key)
    array.delete(key)
    counter = counter + 1
  end

  tree
end

# tree = []
tree = create_tree(5, tree)

puts "Raiz: #{tree.key}"
if tree.left
  puts "#{tree.left.key}"
end
