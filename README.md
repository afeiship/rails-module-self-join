# rails-module-self-join
> Self join case for rails.

## steps
```rb
# 1. generate model
rails g model Employee name:string


# 2. Ass for model
class Employee < ApplicationRecord
  has_ancestry
end

# 3. migration
rails g migration add_ancestry_to_employee ancestry:string:index

# 4. db migrate
rake db:migrate
```

## roles
- 平级: equal         - (null)
- 上级: superior      - (parent)
- 下级: subordinate   - (children)
- 职员: employee

## tree json
```rb
class Employee < ApplicationRecord
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
```

## ap tree
```shell
irb(main):005:0> e1 = Employee.find(1)
  Employee Load (0.5ms)  SELECT "employees".* FROM "employees" WHERE "employees"."id" = ? LIMIT ?  [["id", 1], ["LIMIT", 1]]
=> #<Employee id: 1, name: "e1", created_at: "2020-08-28 00:50:16", updated_at: "2020-08-28 00:50:16", ancestry: nil>
irb(main):006:0> ap e1.tree
  Employee Load (0.2ms)  SELECT "employees".* FROM "employees" WHERE (("employees"."ancestry" LIKE '1/%' OR "employees"."ancestry" = '1') OR "employees"."id" = 1)
[
    [0] {
             :name => "e1",
               :id => 1,
        :parent_id => nil,
         :children => [
            [0] {
                     :name => "e2",
                       :id => 2,
                :parent_id => 1,
                 :children => []
            },
            [1] {
                     :name => "e3",
                       :id => 3,
                :parent_id => 1,
                 :children => [
                    [0] {
                             :name => "e4",
                               :id => 4,
                        :parent_id => 3,
                         :children => []
                    },
                    [1] {
                             :name => "e5",
                               :id => 5,
                        :parent_id => 3,
                         :children => []
                    }
                ]
            }
        ]
    }
]
=> nil
```


## resources
- https://guides.rubyonrails.org/association_basics.html#self-joins
- https://www.zybang.com/question/72735a97d19bb435de837e01a6a6387e.html
- https://ruby-china.org/wiki/rails_plugin_ancestry_usage
- https://github.com/stefankroes/ancestry
- http://railscasts.com/episodes/262-trees-with-ancestry?view=comments