# rails-module-self-join
> Self join case for rails.

## steps
```rb
# 1. generate model
rails g model Employee name:string


# 2. Ass for model
class Employee < ApplicationRecord
  has_many :children, class_name: "Employee",
                          foreign_key: "parent_id"
  belongs_to :parent, class_name: "Employee", optional: true
  has_ancestry
end

# 3. migration
class CreateEmployees < ActiveRecord::Migration[5.0]
  def change
    create_table :employees do |t|
      t.references :parent
      t.timestamps
    end
  end
end

# 4. db migrate
rails g migration add_ancestry_to_employee ancestry:string:index
rake db:migrate
```

## rols
- 平级: equal
- 上级: superior
- 下级: subordinate
- 职员: employee


## resources
- https://guides.rubyonrails.org/association_basics.html#self-joins
- https://www.zybang.com/question/72735a97d19bb435de837e01a6a6387e.html
- https://ruby-china.org/wiki/rails_plugin_ancestry_usage