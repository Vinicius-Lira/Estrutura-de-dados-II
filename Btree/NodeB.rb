require_relative 'Node'

class NodeB
  attr_accessor :page, :number_keys, :order_node_m

  def initialize(order_node_m)
    @page = []
    @order_node_m = order_node_m
    @number_keys = 0
    i = 0
    while i < (@order_node_m + 1)
      @page[i] = Node.new
      i = i + 1
    end
    @number_keys = counter_keys_node
  end

  def counter_keys_node
    i = 0
    keys = 0
    while i < @order_node_m
      if @page[i].key != nil
        keys = keys + 1
      end
      i = i + 1
    end
    @number_keys = keys
  end

  def order_page
    @number_keys = counter_keys_node
    i = 0
    while i < @number_keys
      j = 0
      while j < (@number_keys - 1)
        if @page[j].key > @page[j + 1].key
          aux = @page[j]
          @page[j] = @page[j + 1]
          @page[j + 1] = aux
        end
        j = j + 1
      end
      i = i + 1
    end
  end

end
