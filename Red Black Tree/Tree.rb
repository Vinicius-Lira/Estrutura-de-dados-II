require_relative 'Node.rb'

class Tree
  attr_accessor :root, :nill

  def initialize
    @root = Node.new
    @nill = Node.new
  end
end
