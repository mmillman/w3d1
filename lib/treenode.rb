class TreeNode
  attr_accessor :value, :children, :parent
  def initialize(value=nil)
    @value = value
    @children = []
  end

  def add_child(child)
    child.parent = self
    @children << child
  end




end