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

end
