class Node
  attr_accessor :left, :right, :parent, :color, :key

  def initialize
    @left = nil
    @right = nil
    @parent = nil
    @color = false
    @key = 0
  end
end
