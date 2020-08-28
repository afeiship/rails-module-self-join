class Employee < ApplicationRecord
  has_ancestry

  include AncestryNode

  def self.node_iteratee(node)
    {
      name: node.name,
    }
  end
end
