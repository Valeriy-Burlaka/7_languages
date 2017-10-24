#---
# Excerpted from "Seven Languages in Seven Weeks",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/btlang for more book information.
#---
class Tree
  attr_accessor :node_name, :children

  def initialize(tree={})
    @node_name = tree.keys.first
    @children = []
    tree[@node_name].each { |k, v| @children.push(Tree.new({k => v})) }
  end

  def visit_all(&block)
    visit &block
    children.each {|c| c.visit_all &block}
  end

  def visit(&block)
    block.call self
  end
end


h = {"grandpa" =>
  { "dad" =>
    {"child 1" => {}, "child 2" => {} },
   "uncle" =>
    {"child 3" => {}, "child 4" => {} }
  }
}
tree = Tree.new(h)

puts "Visiting a node"
tree.visit {|node| puts node.node_name}
puts

puts "Visiting the whole tree"
tree.visit_all {|node| puts node.node_name}
