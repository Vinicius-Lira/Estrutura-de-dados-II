class Node
  attr_accessor :left, :right, :parent, :key, :color

  def initialize
    @left = nil
    @right = nil
    @color = false
    @key = nil
  end
end
