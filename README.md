# rails-module-self-join
> Self join case for rails.

## steps
```rb
# 1. generate model
rails g model Employee


# 2. Ass for model
class Employee < ApplicationRecord
  has_many :subordinates, class_name: "Employee",
                          foreign_key: "superior_id"
  belongs_to :superior, class_name: "Employee", optional: true
end

# 3. migration
class CreateEmployees < ActiveRecord::Migration[5.0]
  def change
    create_table :employees do |t|
      t.references :superior
      t.timestamps
    end
  end
end

# 4. db migrate
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