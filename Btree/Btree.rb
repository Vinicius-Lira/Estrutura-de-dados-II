require_relative 'NodeB'

class Btree
  attr_accessor :tree, :order_node_m

  def initialize(order_node_m)
    @tree = ""
    @order_node_m = order_node_m * 2
  end

  def insert(key)
    if @tree == ""
      puts "arvore vazia"
      @tree = NodeB.new(@order_node_m)
      @tree.page[0].key = key
    elsif @tree.counter_keys_node < @order_node_m
      number_keys_node = @tree.counter_keys_node
      @tree.page[number_keys_node].key = key
    end
  end

  def split(node, node_anterior, root)
    node_a = NodeB.new(order_node)
    node_B = NodeB.new(order_node)
    to_promote = node.page[@order_node_m/2 + 1]
    node.order_node
    i = 0
    while i < @order_node_m/2
      node_a.page[i] = node.page[i]
      i = i + 1
    end
    i = (@order_node_m/2) + 1
    while i < @order_node_m
      node_b.page[i] = node.page[i]
      i = i + 1
    end

    if node_anterior != ""
      i = 0
      while i < @order_node_m
        if node_anterior.page[i] == nil
          node_anterior.page[i] = to_promote
          break
        end
        i = i + 1
      end
    end

  end

end
