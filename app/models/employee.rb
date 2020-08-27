class Employee < ApplicationRecord
  has_many :children, class_name: "Employee",
                      foreign_key: "parent_id"
  belongs_to :parent, class_name: "Employee", optional: true
  has_ancestry

  def tree
    nodes = subtree.arrange
    Employee.json_tree(nodes)
  end

  def self.json_tree(nodes)
    nodes.map do |node, sub_nodes|
      {
        name: node.name,
        id: node.id,
        parent_id: node.parent_id,
        children: json_tree(sub_nodes).compact,
      }
    end
  end
end
