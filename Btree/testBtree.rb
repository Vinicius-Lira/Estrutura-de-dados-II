require_relative 'Btree'

tree = Btree.new(2)
tree.insert(10)
tree.insert(6)
tree.insert(7)
tree.insert(8)
tree.tree.counter_keys_node
puts "Number keys page #{tree.tree.number_keys}"
puts tree.tree.page[0].key
puts tree.tree.page[1].key
puts tree.tree.page[2].key
puts tree.tree.page[3].key
tree.tree.order_page
puts "\norder"
puts tree.tree.page[0].key
puts tree.tree.page[1].key
puts tree.tree.page[2].key
puts tree.tree.page[3].key
puts "4: '#{tree.tree.page[4].key}'"
