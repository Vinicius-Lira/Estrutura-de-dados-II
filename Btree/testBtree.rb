require_relative 'Btree'

tree = Btree.new(2)
tree.insert(10)
tree.insert(50)
tree.insert(7)

tree.tree.counter_keys_node
if tree.tree.number_keys == tree.order_node_m
	puts "Page cheia"
end
puts "Number keys page #{tree.tree.number_keys}"
puts "Number max keys page #{tree.order_node_m}"
# puts tree.tree.page[0].key
tree.tree.order_page
# i = 0
# while( i < 3)
# 	puts tree.tree.page[i].key
# 	i = i + 1
# end

tree.split(tree.tree, nil, nil)

puts tree.tree.page[0].right

# Comando para ordenar o nodo(pagina)
# tree.tree.order_page

