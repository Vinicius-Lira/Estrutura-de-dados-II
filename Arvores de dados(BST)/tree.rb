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
      return tree_temp
    end

    tree_temp = minValueNode(tree.right)

    tree.key = tree_temp.key

    tree.right = delete(tree.right, tree_temp.key)
  end

  return tree
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

def create_tree_empty(tree)
  tree = nil
end

def delete_tree
  nil
end

def main
  tree = nil

  while true
    puts "\n1 - create tree"
    puts "2 - add random keys in tree"
    puts "3 - add key in tree"
    puts "4 - delete key the tree"
    puts "5 - delete tree"
    puts "6 - print tree"
    puts "7 - search key"
    puts "8 - exit"
    print "Choose an option:"
    option = gets.to_i

    case option
    when 1
      system "clear"
      tree = create_tree_empty(tree)
    when 2
      print "\n size the tree: "
      size_tree = gets.to_i
      tree = create_tree(size_tree, tree)
      system "clear"
    when 3
      print "\n key to add: "
      key = gets.to_i
      tree = new_node(tree, key)
      system "clear"
    when 4
      print "\n key to delete: "
      key = gets.to_i
      tree = delete(tree, key)
      system "clear"
    when 5
      tree = delete_tree
      system "clear"
      puts "Success to delete\n\n"
    when 6
      system "clear"
      puts "1 - Pre-order"
      puts "2 - In-order"
      puts "3 - Post-order"
      puts "4 - Root"
      option = gets.to_i
      case option
      when 1
        system "clear"
        preorder(tree)
      when 2
        system "clear"
        inorder(tree)
      when 3
        system "clear"
        postorder(tree)
      when 4
        system "clear"
        puts "ROOT: #{tree.key}"
      end
    when 8
      system "clear"
      break
    when 7
      system "clear"
      print "key for search: "
      key = gets.to_i
      if search(tree,key)
        puts "key exists"
      else
        puts "key does not exist"
      end
    end
  end
end

main


#base fonte codigo delete http://www.geeksforgeeks.org/binary-search-tree-set-2-delete/
