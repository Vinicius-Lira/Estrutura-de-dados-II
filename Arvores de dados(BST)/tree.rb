require_relative 'Node'

def new_node(tree, key)
  node = Node.new
  node.key = key
  if tree
    loop do
      if tree.key < key
        if tree.left == nil
          tree.left = node
          tree
        else
          tree = tree.left
        end
      elsif tree.key > key
        if tree.right == nil
          tree.right = node
          tree
        else
          tree = tree.right
        end
      end
    end
  else
    node
  end
  tree
end

count = 1

key = 5
tree = Node.new
tree.key = key

new_node tree, 6
