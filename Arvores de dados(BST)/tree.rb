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

def search(tree, key)
	while(true)
    unless tree
      return nil
    end

    if tree.key == key
      return tree
    end

    if tree.key > key
      tree = tree.left

    elsif tree.key <= key  
		  tree = tree.right
    end
	end
end

def minValueNode(tree)
  currentNode = tree

  while correntNode.left != nil
    currentNode = currentNode.left
  end

  return currentNode
end

def delete(tree, key)
  unless tree
    return tree
  end

  if tree.key > key
    tree.left = delete(tree.left, key)
  elsif tree.key < key
    tree.right = delete(tree.right, key)
  else
    unless tree.left
      tree_temp = tree.right
      tree = nil
      return tree_temp
    end
    if tree.right == nil
      tree_temp = tree.left
      tree = nil
      return treem_temp
    end

    tree_temp = minValueNode(tree.right)

    tree.key = tree_temp.key

    tree.right = delete(tree.right, tree_temp.key)
  end

  return tree
end

def create_tree(number_node, tree)
  array = []
  counter = 1

  while counter <= number_node
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

tree = create_tree(10, tree)

puts "Raiz: #{tree.key}"

value = search(tree, 6)

if value != nil
  puts "Search: #{value.key}"
end

puts "key delete: " 
key = gets.to_i
puts delete(tree, 6)
