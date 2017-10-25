require_relative 'Node.rb'

class Tree
  attr_accessor :root, :nill

  def initialize
    @root = Node.new
    @nill = Node.new
    @nill.left = nil
    @nill.right = nil
    @nill.parent = nil
    @nill.color = true
    @nill.key = nil
  end
end
