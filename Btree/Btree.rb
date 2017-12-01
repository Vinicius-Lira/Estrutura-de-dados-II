require_relative 'NodeB'

class Btree
  attr_accessor :tree, :order_node_m, :counter_keys

  def initialize(order_node_m)
    @tree = ""
    @order_node_m = order_node_m * 2 - 1
  end

  def insert(key)
    # numero_maximo = (order_node_m * 2) - 1
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
    node_a = NodeB.new(@order_node_m)
    node_b = NodeB.new(@order_node_m)
    to_promote = node.page[@order_node_m/2]
    node.order_node_m
    i = 0
    # Copia a metade do nodo para um novo nodo
    while i < @order_node_m/2 
      node_a.page[i] = node.page[i]
      i = i + 1
    end

    # Copia a outra metade para outro node
    k = 0
    i = (@order_node_m/2)+1
    while i <= @order_node_m
      node_b.page[k] = node.page[i]
      i = i + 1
      k = k + 1
    end

    node_a.print_node(node_a)
    node_b.print_node(node_b)
    puts "node to promote #{to_promote.key}"
    if node_anterior != nil
      i = 0
      while i < @order_node_m
        if node_anterior.page[i] == nil
          node_anterior.page[i] = to_promote
          break
        end
        i = i + 1
      end
    else
      new_node = NodeB.new(@order_node_m)
      new_node.page[0] = to_promote
      new_node.page[0].left = node_a
      new_node.page[0].right = node_b
    end
    node = new_node
  end

end
