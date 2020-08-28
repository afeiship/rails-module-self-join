module AncestryNode
  extend ActiveSupport::Concern

  def tree
    nodes = subtree.arrange
    self.class.json_tree(nodes)
  end

  class_methods do
    def json_tree(nodes)
      nodes.map do |node, sub_nodes|
        item = node_iteratee(node)
        item.merge({
          id: node.id,
          parent_id: node.parent_id,
          children: json_tree(sub_nodes).compact,
        })
      end
    end
  end
end
