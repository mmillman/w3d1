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

  def bfs(value)
    queue = [self]
    until queue.empty?
      checking_node = queue.shift
      return checking_node if checking_node.value == value
      checking_node.children.each { |child| queue << child }
    end
  end

  def dfs(value)

    #REV would this have worked with a more complicated tree structure? 
    #Seems to only ahve passed your test because your tree children didn't have left/right children as well...
    return self.value if self.value == value
    children.each { |child| child.dfs (value) }
  end
end

