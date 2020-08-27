class Employee < ApplicationRecord
  has_many :children, class_name: "Employee",
                      foreign_key: "parent_id"
  belongs_to :parent, class_name: "Employee", optional: true
  has_ancestry
end
