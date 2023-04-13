#!/usr/bin/env ruby
# frozen_string_literal: true

class Tree
  attr_accessor :children, :node_name

  def initialize(tree = {})
    @node_name = tree.keys.first
    @children = []
    tree[@node_name].each { |node, child| @children << Tree.new(node => child) }
  end

  def visit_all(&block)
    visit(&block)
    children.each { |child| child.visit_all(&block) }
  end

  def visit(&block)
    block.call self
  end
end

ruby_tree = Tree.new({
  'grandpa' => {
    'dad' => {
      'child 1' => {},
      'child 2' => {}
    },
    'uncle' => {
      'child 3' => {},
      'child 4' => {}
    }
  }
})

puts 'Visiting a node'
ruby_tree.visit {|node| puts node.node_name}

puts 'Visiting all nodes'
ruby_tree.visit_all {|node| puts node.node_name}
