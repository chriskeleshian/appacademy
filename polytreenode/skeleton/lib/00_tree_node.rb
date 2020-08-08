require "byebug"

class PolyTreeNode

  attr_reader :parent, :children, :value
  def initialize(value)
    @parent = nil
    @children = Array.new
    @value = value
  end

  def parent=(node)
      @parent.remove_child(self) unless @parent == nil
      @parent = node
      node.add_child(self) unless node == nil
      
  end
  
  def add_child(child_node)
    @children << child_node
  end

  def remove_child(child_node)
    raise "Error: not a child" if !@children.include?(child_node)
    @children.delete(child_node)
  end

  def dfs(target_value)
    #debugger
    return self if target_value == @value
    @children.each do |child| 
      result = child.dfs(target_value) 
      return result unless result.nil?
    end
    nil
  end

  def bfs(target_value)
    queue = Array.new
    queue << self
    until queue.empty?
     # debugger
      first_node = queue.shift
      return first_node if first_node.value == target_value
      queue.concat(first_node.children)
    end
  end


end
